json.extract! recipe, :id, :name, :recipe, :created_at, :updated_at, :ingredients
json.url recipe_url(recipe, format: :json)
