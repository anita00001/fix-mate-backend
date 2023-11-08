require 'rails_helper'

RSpec.describe 'Api::V1::UsersController', type: :request do
  describe 'POST /signup' do
    it 'creates a new user' do
      user_params = {
        user: {
          email: 'example@test.com',
          password: 'password'
        }
      }

      post '/signup', params: user_params, as: :json

      expect(response).to have_http_status(200)
      expect(response.body).to include('Signed up sucessfully.')
    end
  end

  describe 'POST /login' do
    it 'logs in a user' do
      user_params = {
        user: {
          email: 'example@test.com',
          password: 'password'
        }
      }

      post '/signup', params: user_params, as: :json

      post '/login', params: user_params, as: :json

      expect(response).to have_http_status(200)
      expect(response.body).to include('Logged in sucessfully.')
    end
  end
end
