class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern

  helper_method :current_user
  helper_method :is_admin
  helper_method :is_manager

  def current_user
    @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

  def is_admin
    User.find_by(id: session[:user_id]).role == 'admin'
  end

  def is_manager
    User.find_by(id: session[:user_id]).role == 'admin' || 'teamleader'
  end

  before_action :require_login

  private

  def require_login
    unless logged_in?
      redirect_to login_path
    end
  end

  def logged_in?
    !!current_user
  end
end
