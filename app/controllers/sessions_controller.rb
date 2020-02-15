class SessionsController < WebApplicationController
  include AccessTab
  before_action :restrict_access, only: %i[new create]

  def create
    user = User.by_email(user_params[:email]).take

    if user&.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to(root_path, flash: { success: t('.login_success') })
    else
      redirect_to(new_sessions_path, flash: { fail: t('.incorrect_email_or_password') })
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, flash: { success: t('.logged_out') }
  end

  private

  def user_params
    params.permit(:email, :password)
  end
end
