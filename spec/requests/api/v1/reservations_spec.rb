require 'swagger_helper'

describe 'Reservations API' do
  let!(:expert) { create(:expert) } # Create a valid 'Expert' record
  let!(:user) { create(:user) }
  it 'Show all Reservations' do # Create a valid 'User' record
    path '/api/v1/reservations' do
      get 'List all reservations' do
        tags 'Reservations'
        produces 'application/json'
        description 'List all reservations'
        security [Bearer: {}]

        response '200', 'List of all Reservations' do
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

        let(:reservation) do
          {
            expert_id: expert.id, # Replace with the actual values you want to use
            user_id: user.id, # Replace with the actual values you want to use
            city: 'Sample City',
            date: '2023-11-01'
          }
        end

        response '201', 'Reservation created' do
          run_test!
        end
      end
    end
  end
  it 'should show a reservation' do
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
end
