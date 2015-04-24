module API
  module V1
    # Controls the authentication process
    class AuthenticationController < API::APIController
      skip_before_action :authenticate_request

      def authenticate
        authentication = AuthenticateUser.call(params[:email],
                                               params[:password])

        if authentication.success?
          render json: { status: 200, auth_token: authentication.result }
        else
          render json: { status: :unauthorized, error: authentication.errors },
                 status: :unauthorized
        end
      end
    end
  end
end
