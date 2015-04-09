class SessionsController < ApplicationController
  skip_before_action :authorize

  def new
    if login_user
      redirect_to user_root_path(display_name: login_user.display_name)
    else
      @form = User::LoginForm.new
      render action: 'new'
    end
  end

  def create
    @form = User::LoginForm.new(params[:user_login_form])
    if @form.display_name.present?
      user = User.find_by(display_name: @form.display_name)
    end
    if User::Authenticator.new(user).authenticate(@form.password)
      if user.suspended?
        flash.now.alert = 'アカウントが停止されています。'
        render action: 'new'
      else
        session[:user_id] = user.id
        flash.notice = 'ログインしました。'
        redirect_to user_root_path(display_name: user.display_name)
      end
    else
      flash.now.alert = 'メールアドレスまたはパスワードが正しくありません。'
      render action: 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    flash.notice = 'ログアウトしました。'
    redirect_to :login
  end
end
