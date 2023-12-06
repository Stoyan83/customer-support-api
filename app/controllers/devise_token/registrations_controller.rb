# frozen_string_literal: true

class DeviseToken::RegistrationsController < DeviseTokenAuth::RegistrationsController
  def render_create_error
    render json: {
      errors: resource_errors[:full_messages]
    }, status: 422
  end
end
