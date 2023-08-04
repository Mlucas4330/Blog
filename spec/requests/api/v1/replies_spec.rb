require 'swagger_helper'

RSpec.describe 'api/v1/replies', type: :request do
  path '/api/v1/replies' do

    get('list replies') do
      tags 'Replies'
      consumes 'application/json'
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

    post('create reply') do
      tags 'Replies'
      consumes 'application/json'
      parameter name: :reply, in: :body, schema: {
        type: :object,
        properties: {
          body: { type: :string },
          comment_id: { type: :string }
        },
        required: [ 'body', 'comment_id' ]
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

  path '/api/v1/replies/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'
    get('show reply') do
      tags 'Replies'
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

    patch('update reply') do
      tags 'Replies'
      consumes 'application/json'
      parameter name: :reply, in: :body, schema: {
        type: :object,
        properties: {
          body: { type: :string }
        },
        required: [ 'body' ]
      }
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

    put('update reply') do
      tags 'Replies'
      consumes 'application/json'
      parameter name: :reply, in: :body, schema: {
        type: :object,
        properties: {
          body: { type: :string }
        },
        required: [ 'body' ]
      }
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

    delete('delete reply') do
      tags 'Replies'
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

  path '/api/v1/replies/{id}/like' do
    parameter name: 'id', in: :path, type: :string, description: 'id'
    get('like reply') do
      tags 'Replies'
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
end
