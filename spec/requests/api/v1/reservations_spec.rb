require 'swagger_helper'

describe 'Reservations API' do
  path '/api/v1/reservations' do
    get 'List all reservations' do
      tags 'Reservations'
      produces 'application/json'
      description 'List all reservations'
      security [Bearer: {}]

      response '200', 'List of reservations' do
        run_test!
      end
    end

    post 'Create a new reservation' do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          expert_id: { type: :integer },
          user_id: { type: :integer },
          city: { type: :string },
          date: { type: :string, format: :date }
        },
        required: %w[expert_id user_id city date]
      }

      response '201', 'Reservation created' do
        run_test!
      end

      response '422', 'Invalid request' do
        run_test!
      end
    end
  end

  path '/api/v1/reservations/{id}' do
    parameter name: :id, in: :path, type: :integer

    get 'Show reservation details' do
      tags 'Reservations'
      produces 'application/json'
      description 'Show reservation details'
      security [Bearer: {}]

      response '200', 'Reservation details' do
        run_test!
      end

      response '404', 'Reservation not found' do
        run_test!
      end
    end
  end
end
