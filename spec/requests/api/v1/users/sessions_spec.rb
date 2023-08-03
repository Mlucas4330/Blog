require 'swagger_helper'

RSpec.describe 'api/v1/users/sessions', type: :request do
    path '/api/v1/login'
    post('login') do
        tags 'Auth'
        consumes 'application/json'
        parameter name: :login, in: :body, schema: {
          type: :object,
          properties: {
            email: { type: :string },
            password: { type: :string }
          },
          required: [ 'email', 'password' ]
        }
        response(200, 'successful') do
          let(:post_id) { '123' }
  
          after do |example|
            example.metadata[:response][:content] = {
              'application/json' => {
                example: JSON.parse(response.body, symbolize_names: true)
              }
            }
          end
          run_test!
        end
      end
    path '/api/v1/logout'
    delete('logout') do
        tags 'Auth'
        consumes 'application/json'
        response(200, 'successful') do
          let(:id) { '123' }
  
          after do |example|
            example.metadata[:response][:content] = {
              'application/json' => {
                example: JSON.parse(response.body, symbolize_names: true)
              }
            }
          end
          run_test!
        end
      end
end
