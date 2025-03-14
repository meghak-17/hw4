class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user, :logged_in?
  def logged_in?
    !!current_user
  end

  def authenticate_user
    redirect_to authentication_new_path unless logged_in?
  end
end
