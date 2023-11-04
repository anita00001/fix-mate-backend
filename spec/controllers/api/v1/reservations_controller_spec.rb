require 'rails_helper'

RSpec.describe 'Api::V1::ReservationsController', type: :request do
  let!(:expert) { create(:expert) }
  let!(:user) { create(:user) }

  describe 'GET /api/v1/reservations' do
    it 'lists all reservations' do
      get '/api/v1/reservations'
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /api/v1/reservations' do
    it 'creates a new reservation' do
      reservation_params = {
        expert_id: expert.id,
        user_id: user.id,
        city: 'Sample City',
        date: '2023-11-01'
      }

      post '/api/v1/reservations', params: { reservation: reservation_params }, as: :json
      expect(response).to have_http_status(201)
    end
  end

  describe 'GET /api/v1/reservations/:id' do
    it 'returns 404 when the reservation is not found' do
      get '/api/v1/reservations/12345'
      expect(response).to have_http_status(404)
    end
  end
end
