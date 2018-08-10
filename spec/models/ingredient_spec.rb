require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  it 'validate name presence' do
    should validate_presence_of :name
  end
end
