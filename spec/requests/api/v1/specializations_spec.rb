require 'swagger_helper'

RSpec.describe 'API::V1::Specializations', type: :request do
  path '/api/v1/specializations' do
    get 'list all of specializations' do
      tags 'Specializations'
      produces 'application/json'

      response '200', 'successful' do
        schema type: :array,
               items: {
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   description: { type: :string }
                 }
               }

        run_test!
      end
    end

    post 'creates a specialization' do
      tags 'Specializations'
      consumes 'application/json'
      parameter name: :specialization, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string }
        },
        required: %w[name description]
      }

      response '201', 'created' do
        let(:specialization) { { name: 'Programming', description: 'Software development' } }
        run_test!
      end

      response '422', 'unprocessable entity' do
        let(:specialization) { { name: '', description: '' } }
        run_test!
      end
    end
  end
end
