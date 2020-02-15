# frozen_string_literal: true

class ApiApplicationController < ApplicationController
  protect_from_forgery with: :null_session

  def authorize_request
    begin
      @decoded = JsonWebToken.decode(http_token)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

  private

  def http_token
    return if request.headers['Authorization'].blank?

    @http_token ||= request.headers['Authorization'].split(' ').last
  end
end
