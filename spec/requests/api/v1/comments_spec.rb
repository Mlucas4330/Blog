require 'swagger_helper'

RSpec.describe 'api/v1/comments', type: :request do

  path '/api/v1/posts/{post_id}/comments' do
    parameter name: 'post_id', in: :path, type: :string, description: 'post_id'

    get('list comments') do
      tags 'Comments'
      consumes 'application/json'
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

    post('create comment') do
      tags 'Comments'
      consumes 'application/json'
      parameter name: 'token', in: :header, type: :string, required: true, description: 'token'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          body: { type: :string }
        },
        required: [ 'body' ]
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
  end

  path '/api/v1/comments/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'id'
    get('show comment') do
      tags 'Comments'
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

    patch('update comment') do
      tags 'Comments'
      consumes 'application/json'
      parameter name: 'token', in: :header, type: :string, required: true, description: 'token'
      parameter name: :comment, in: :body, schema: {
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

    put('update comment') do
      tags 'Comments'
      consumes 'application/json'
      parameter name: 'token', in: :header, type: :string, required: true, description: 'token'
      parameter name: :comment, in: :body, schema: {
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

    delete('delete comment') do
      tags 'Comments'
      consumes 'application/json'
      parameter name: 'token', in: :header, type: :string, required: true, description: 'token'
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

  path '/api/v1/comments/{id}/like' do
    parameter name: 'id', in: :path, type: :string, description: 'id'
    parameter name: 'token', in: :header, type: :string, required: true, description: 'token'
    get('like comment') do
      tags 'Comments'
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
