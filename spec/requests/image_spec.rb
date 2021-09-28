require 'swagger_helper'

RSpec.describe 'image', type: :request do
      path '/images/{id}' do

    get 'Retrieves an image' do
      tags 'Images'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'image found' do
        run_test!
      end
    end
  end
end
