require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  describe 'GET /recipes.json' do
    it 'should return 200 OK and response in JSON format' do
      get recipes_path(format: :json)
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq('application/json')
    end
  end
end
