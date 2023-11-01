require 'rails_helper'

RSpec.describe 'Api::V1::ExpertsController', type: :request do
  describe 'GET /api/v1/experts' do
    it 'returns a list of experts' do
      get '/api/v1/experts'
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /api/v1/experts' do
    it 'creates a new expert' do
      specialization = Specialization.create!(name: 'Specialization', description: 'Description')

      expert_params = {
        first_name: 'John',
        last_name: 'Doe',
        email: 'johndoe@example.com',
        address: '123 Main Street',
        experience: 5,
        status: true,
        removed: false,
        fee: 100,
        specialization_id: specialization.id
      }

      post '/api/v1/experts', params: { expert: expert_params }, as: :json

      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /api/v1/experts/:id' do
    it 'shows expert details' do
      expert = Expert.create!(
        first_name: 'John',
        last_name: 'Doe',
        email: 'johndoe@example.com',
        address: '123 Main Street',
        experience: 5,
        status: true,
        removed: false,
        fee: 100,
        specialization_id: Specialization.create!(name: 'Specialization', description: 'Description').id
      )

      get "/api/v1/experts/#{expert.id}"

      expect(response).to have_http_status(200)
    end
  end

  describe 'PUT /api/v1/experts/:id' do
    it 'toggles the remove status of an expert' do
      expert = Expert.create!(
        first_name: 'John',
        last_name: 'Doe',
        email: 'johndoe@example.com',
        address: '123 Main Street',
        experience: 5,
        status: true,
        removed: false,
        fee: 100,
        specialization_id: Specialization.create!(name: 'Specialization', description: 'Description').id
      )

      put "/api/v1/experts/#{expert.id}", params: { expert: { removed: true } }, as: :json

      expect(response).to have_http_status(404)
    end
  end
end
