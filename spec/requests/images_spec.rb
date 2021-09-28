require 'swagger_helper'

RSpec.describe 'images', type: :request do

  path '/images/{image_id}/transfer_ownership' do
    # You'll want to customize the parameter types...
    parameter name: 'image_id', in: :path, type: :string, description: 'image_id'

    post('transfer_ownership image') do
      tags 'Images'
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

  path '/images/{image_id}/publicize' do
    # You'll want to customize the parameter types...
    parameter name: 'image_id', in: :path, type: :string, description: 'image_id'

    post('publicize image') do
      tags 'Images'
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

  path '/images/{image_id}/privatize' do
    # You'll want to customize the parameter types...
    parameter name: 'image_id', in: :path, type: :string, description: 'image_id'

    post('privatize image') do
      tags 'Images'
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

  path '/images/{mode}/{unique_name}' do
    # You'll want to customize the parameter types...
    parameter name: 'mode', in: :path, type: :string, description: 'mode'
    parameter name: 'unique_name', in: :path, type: :string, description: 'unique_name'

    get('view image') do
      tags 'Images'
      response(200, 'successful') do
        let(:mode) { '123' }
        let(:unique_name) { '123' }

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

  path '/images' do

    get('list images') do
      tags 'Images'
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

    post('create image') do
      tags 'Images'
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

  path '/images/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show image') do
      tags 'Images'
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

    patch('update image') do
      tags 'Images'
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

    put('update image') do
      tags 'Images'
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

    delete('delete image') do
      tags 'Images'
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
