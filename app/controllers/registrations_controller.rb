class RegistrationsController < ApplicationController
  include AccessTab
  before_action :restrict_access, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)

    if user.errors.any?
      redirect_to(new_registrations_path, flash: { fail: user.errors.full_messages.join('. ') })
    else
      session[:user_id] = user.id
      redirect_to(root_path, flash: { success: t('.sign_up_success') })
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
