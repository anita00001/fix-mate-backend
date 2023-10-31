require 'swagger_helper'

describe 'Experts API' do
  path '/api/v1/experts' do
    get 'List all experts' do
      tags 'Experts'
      produces 'application/json'
      description 'List all experts'
      security [Bearer: {}]

      response '200', 'List of experts' do
        run_test!
      end
    end

    post 'Create a new expert' do
      tags 'Experts'
      consumes 'application/json'
      parameter name: :expert, in: :body, schema: {
        type: :object,
        properties: {
          first_name: { type: :string },
          last_name: { type: :string },
          email: { type: :string },
          address: { type: :string },
          experience: { type: :integer },
          status: { type: :string },
          removed: { type: :boolean },
          image: { type: :string },
          fee: { type: :integer },
          specialization_id: { type: :integer }
        },
        required: %w[first_name email]
      }

      response '201', 'Expert created' do
        run_test!
      end

      response '422', 'Invalid request' do
        run_test!
      end
    end
  end

  path '/api/v1/experts/{id}' do
    parameter name: :id, in: :path, type: :integer

    get 'Show expert details' do
      tags 'Experts'
      produces 'application/json'
      description 'Show expert details'
      security [Bearer: {}]

      response '200', 'Expert details' do
        run_test!
      end

      response '404', 'Expert not found' do
        run_test!
      end
    end

    put 'Toggle remove status of expert' do
      tags 'Experts'
      consumes 'application/json'
      parameter name: :expert, in: :body, schema: {
        type: :object,
        properties: {
          removed: { type: :boolean }
        },
        required: %w[removed]
      }

      response '200', 'Toggle successful' do
        run_test!
      end

      response '422', 'Toggle failed' do
        run_test!
      end
    end
  end
end
