class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :recipe, presence: true
  has_and_belongs_to_many :ingredients
end
