# frozen_string_literal: true
json.extract! ingredient, :id, :name, :created_at, :updated_at, :recipes
json.url ingredient_url(ingredient, format: :json)

