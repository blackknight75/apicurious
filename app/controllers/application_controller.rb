class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
   @current_user ||= User.find(session[:user_id]) unless session[:user_id].nil?
  end

  def authorize!
    redirect_to root_path unless current_user
  end
end
