FactoryBot.define do
  factory :recipe do
    name { Faker::Food.dish }
    recipe { Faker::Food.description }
    ingredient_ids {
      FactoryBot.create_list(:ingredient, rand(10)).pluck(:id)
    }
  end
end
