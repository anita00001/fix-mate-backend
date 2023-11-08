class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(_resource, _options = {})
    if current_user
      render json: {
        status: { code: 200, message: 'Logged in sucessfully.', data: current_user }
      }, status: :ok
    else
      render json: {
        status: { code: 401, message: "Couldn't find an active session." }
      }, status: :unauthorized
    end
  end

  def respond_to_on_destroy
    jwt_payload = JWT.decode(request.headers['Authorization'].split[1],
                             Rails.application.credentials.fetch(:secret_key_base)).first

    current_user = User.find(jwt_payload['sub'])

    if current_user
      render json: {
        status: { code: 200, message: 'Logged out sucessfully.' }
      }, status: :ok
    else
      render json: {
        status: { code: 401, message: "Couldn't find an active session." }
      }, status: :unauthorized
    end
  end
end
