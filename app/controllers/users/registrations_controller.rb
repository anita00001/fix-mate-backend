class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _options = {})
    if resource.persisted?
      render json: {
        status: { code: 200, message: 'Signed up sucessfully.', data: resource }
      }, status: :ok
    else
      render json: {
        status: { message: "User couldn't be created successfully.", errors: resource.errors.full_messages }
      }, status: :unprocessable_entity
    end
  end
end
