class User::Base < ApplicationController
  before_action :authorize

  private

  def login_user
    if session[:user_id]
      @login_user ||= User.find_by(id: session[:user_id])
    end
  end

  helper_method :login_user

  def authorize
    unless login_user
      flash.notice = 'ログインしてください。'
      redirect_to :user_login; return false
    end
  end
end
