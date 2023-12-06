# frozen_string_literal: true

module DeviseToken
  class SessionsController < DeviseTokenAuth::SessionsController
    before_action :set_request_start
    after_action :update_auth_header
    after_action :skip_second_update, only: [:create]

    protected

    def skip_second_update
      @skip_second_update = true
    end

    def render_create_success
      update_auth_header

      authorization_header = response.headers['Authorization']
      resource_data = @resource.as_json(only: %i[id name email]).merge('Authorization' => authorization_header)

      render json: {
        data: resource_data
      }, status: :ok
    end

    def update_auth_header
      return if @skip_second_update

      super
    end
  end
end
