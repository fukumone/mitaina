class SessionsController < Staff::Base
  skip_before_action :authorize

  def new
    if current_administrator
      redirect_to :admin_root
    else
      @form = Admin::LoginForm.new
      if params[:token].present?
        if UserToken.useful?(params[:token], "administrator")
          render action: 'new'
        else
          raise NotUseful
        end
      else
        render action: 'new'
      end
    end
  end

  def create
    @form = Admin::LoginForm.new(params[:admin_login_form])
    if @form.email.present?
      administrator = Administrator.find_by(email_for_index: @form.email.downcase)
    end
    if Admin::Authenticator.new(administrator).authenticate(@form.password)
      unless UserToken.useful?(@form.token, "administrator")
        raise NotUseful
      end
      UserToken.update_suspended(@form.token, administrator) if @form.token.present?
      if administrator.suspended?
        flash.now.alert = 'アカウントが停止されています。'
        render action: 'new'
      else
        session[:administrator_id] = administrator.id
        session[:last_access_time] = Time.current
        administrator.up_count_or_zero("success")
        administrator.update_attribute(:deletable, false) if administrator.deletable
        flash.notice = 'ログインしました。'
        redirect_to :admin_root
      end
    else
      administrator.up_count_or_zero("fail") if administrator
      flash.now.alert = 'メールアドレスまたはパスワードが正しくありません。'
      render action: 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    flash.notice = 'ログアウトしました。'
    redirect_to :admin_login
  end
end
