module V0
  class ApiAuthenticationController < ApiApplicationController
    before_action :authorize_request, except: :login

    # POST /auth/login
    def login
      @user = User.find_by_email(user_params[:email])
      if @user&.authenticate(user_params[:password])
        access_token = JsonWebToken.encode(user_id: @user.id)
        time = Time.now + 24.hours.to_i
        render json: { access_token: access_token, exp: time.strftime("%m-%d-%Y %H:%M"),
                       email: @user.email }, status: :ok
      else
        render json: { error: 'unauthorized' }, status: :unauthorized
      end
    end

    private

    def user_params
      params.permit(:email, :password)
    end
  end
end
