class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :recipe, presence: true
end
