require 'swagger_helper'

describe 'Api::V1::Users', type: :request do
  path '/api/v1/users' do
    # Sign Up
    post 'Sign Up' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: %w[email password]
      }

      response '201', 'User created' do
        schema type: :object, '$ref' => '#/definitions/user'
        run_test!
      end

      response '422', 'Invalid request' do
        run_test!
      end
    end
  end

  path '/api/v1/users' do
    # Login
    post 'Login' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: %w[email password]
      }

      response '200', 'Login successful' do
        schema type: :object, '$ref' => '#/definitions/user'
        run_test!
      end

      response '401', 'Unauthorized' do
        schema type: :object, '$ref' => '#/definitions/unauthorized_response'
        run_test!
      end
    end
  end

  path '/api/v1/users' do
    # Logout
    delete 'Logout' do
      tags 'Users'
      produces 'application/json'
      description 'Log out the current user.'
      security [Bearer: {}]

      response '200', 'Logged out successfully' do
        run_test!
      end
    end

    # List all users
    get 'List all users' do
      tags 'Users'
      produces 'application/json'
      description 'Retrieve a list of users.'

      response '200', 'List of users' do
        schema type: :array, items: { '$ref' => '#/definitions/user' }
        run_test!
      end

      response '401', 'Unauthorized' do
        schema type: :object, '$ref' => '#/definitions/unauthorized_response'
        run_test!
      end
    end
  end

  path '/api/v1/users/{id}' do
    parameter name: :id, in: :path, type: :integer

    get 'Show user details' do
      tags 'Users'
      produces 'application/json'
      description 'Retrieve details of a user by ID.'

      response '200', 'User details' do
        schema type: :object, '$ref' => '#/definitions/user'
        run_test!
      end

      response '404', 'User not found' do
        run_test!
      end
    end
  end
end
