class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

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
      redirect_to :login; return false
    end
  end
end
