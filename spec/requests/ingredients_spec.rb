require 'rails_helper'

RSpec.describe 'Ingredients', type: :request do
  describe 'GET /ingredients.json' do
    it 'should return 200 OK and response in JSON format' do
      get ingredients_path(format: :json)
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq('application/json')
    end
  end
end
