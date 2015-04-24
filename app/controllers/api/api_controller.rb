module API
  # API::APIController - Define all that needs to be inherited
  class APIController < ActionController::Base
    before_action :authenticate_request

    # Rescue from raised errors
    rescue_from ActiveRecord::RecordNotFound, with: :no_record_found
    rescue_from ActionController::UnknownFormat, with: :not_valid_json_request

    attr_reader :current_user
    helper_method :current_user

    private

    def authenticate_request
      api_request = AuthenticateApiRequest.new(request.headers)
      @current_user = api_request.call.result

      render json: {
        status: 401,
        error: 'Not authorized'
      }, status: :unauthorized unless @current_user
    end
  end
end
