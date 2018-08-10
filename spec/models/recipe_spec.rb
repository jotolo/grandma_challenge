require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it 'validate name and recipe presence' do
    should validate_presence_of :name
    should validate_presence_of :recipe
  end
end
