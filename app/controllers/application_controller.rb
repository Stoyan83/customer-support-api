class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken

  protect_from_forgery with: :null_session, if: -> { request.format.json? }

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # Permit additional parameters for the sign-in action, including nested `:session` parameter
    devise_parameter_sanitizer.permit(:sign_in, keys: [:session, { session: %i[email password] }])
  end
end
