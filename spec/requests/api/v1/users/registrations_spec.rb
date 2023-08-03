require 'swagger_helper'

RSpec.describe 'api/v1/users/registrations', type: :request do
    path '/api/v1/signup' do 
        post('signup') do
          tags 'Register'
          consumes 'application/json'
          parameter name: :post, in: :body, schema: {
            type: :object,
            properties: {
                username: { type: :string },
                email: { type: :string },
                password: { type: :string }
            },
            required: [ 'username', 'email', 'password' ]
          }
          response(200, 'successful') do
    
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
end
