require 'swagger_helper'

RSpec.describe 'protected_actions', type: :request do

  path '/images/{image_id}/protected_actions' do
    # You'll want to customize the parameter types...    
    parameter name: 'image_id', in: :path, type: :string, description: 'image_id'

    get('list protected_actions') do
      tags 'Images Protected Actions'
      response(200, 'successful') do
        let(:image_id) { '123' }

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

    post('create protected_action') do
      tags 'Images Protected Actions'
      response(200, 'successful') do
        let(:image_id) { '123' }

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

  path '/images/{image_id}/protected_actions/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'image_id', in: :path, type: :string, description: 'image_id'
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show protected_action') do
      tags 'Images Protected Actions'
      response(200, 'successful') do
        let(:image_id) { '123' }
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

    patch('update protected_action') do
      tags 'Images Protected Actions'
      response(200, 'successful') do
        let(:image_id) { '123' }
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

    put('update protected_action') do
      tags 'Images Protected Actions'
      response(200, 'successful') do
        let(:image_id) { '123' }
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

    delete('delete protected_action') do
      tags 'Images Protected Actions'
      response(200, 'successful') do
        let(:image_id) { '123' }
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
