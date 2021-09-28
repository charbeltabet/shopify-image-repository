require 'swagger_helper'

RSpec.describe 'granted_accesses', type: :request do

  path '/users/{user_id}/granted_accesses' do
    # You'll want to customize the parameter types...
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'

    get('list granted_accesses') do
      tags 'User\'s Image Granted Accesses'
      response(200, 'successful') do
        let(:user_id) { '123' }

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

    post('create granted_access') do
      tags 'User\'s Image Granted Accesses'
      response(200, 'successful') do
        let(:user_id) { '123' }

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

    delete('destroy_all granted_access') do
      tags 'User\'s Image Granted Accesses'
      response(200, 'successful') do
        let(:user_id) { '123' }

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

  path '/users/{user_id}/granted_accesses/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show granted_access') do
      tags 'User\'s Image Granted Accesses'
      response(200, 'successful') do
        let(:user_id) { '123' }
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

    patch('update granted_access') do
      tags 'User\'s Image Granted Accesses'
      response(200, 'successful') do
        let(:user_id) { '123' }
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

    put('update granted_access') do
      tags 'User\'s Image Granted Accesses'
      response(200, 'successful') do
        let(:user_id) { '123' }
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

    delete('delete granted_access') do
      tags 'User\'s Image Granted Accesses'
      response(200, 'successful') do
        let(:user_id) { '123' }
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
