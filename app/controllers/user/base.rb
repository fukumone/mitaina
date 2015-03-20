class User::SessionsController < User::Base
  skip_before_action :authorize

  def new
    if login_user
      redirect_to :user_root
    else
      @form = User::LoginForm.new
      render action: 'new'
    end
  end

  def create
    @form = User::LoginForm.new(params[:user_login_form])
    if @form.email.present?
      user = User.find_by(email_for_index: @form.email.downcase)
    end
    if User::Authenticator.new(user).authenticate(@form.password)
      session[:user_id] = user.id
      flash.notice = 'ログインしました。'
      redirect_to :user_root
    else
      flash.now.alert = 'メールアドレスまたはパスワードが正しくありません。'
      render action: 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    flash.notice = 'ログアウトしました。'
    redirect_to :user_root
  end
end
