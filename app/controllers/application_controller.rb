class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: current_user_id) if current_user_id
  end

  def current_user_id
    @current_user_id ||= session[:user_id]
  end

  protected

  def authenticate_user
    return redirect_to new_session_path(redirect_to: redirect_after_sign_in) unless current_user
  end

  private

  def redirect_after_sign_in
    request.url
  end
end
