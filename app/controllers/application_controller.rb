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
    return if current_user

    redirect_to(new_sessions_path(redirect_to: redirect_after_sign_in), flash: { warning: 'You need to sign in first' })
  end

  private

  def redirect_after_sign_in
    request.url
  end
end
