require 'swagger_helper'

describe 'api/v1/user', type: :request do
  path '/signup' do
    post 'Sign Up' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              email: { type: :string },
              password: { type: :string }
            },
            required: %w[email password]
          }
        }
      }
      let(:user) do
        {
          user: {
            email: 'example@test.com',
            password: 'password'
          }
        }
      end
      response '200', 'Signed up successfully' do
        run_test!
      end
    end
  end

  path '/login' do
    post 'Login' do
      path '/signup' do
        post 'Sign Up' do
          tags 'Users'
          consumes 'application/json'
          parameter name: :user, in: :body, schema: {
            type: :object,
            properties: {
              user: {
                type: :object,
                properties: {
                  email: { type: :string },
                  password: { type: :string }
                },
                required: %w[email password]
              }
            }
          }
          let(:user) do
            {
              user: {
                email: 'example@test.com',
                password: 'password'
              }
            }
          end
          response '200', 'Logged in successfully' do
            run_test!
          end
        end
      end
    end
  end
end
