require 'swagger_helper'

describe 'Reservations API' do
  let!(:expert) { create(:expert) }
  let!(:user) { create(:user) }
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
          expert_id: expert.id,
          user_id: user.id,
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
