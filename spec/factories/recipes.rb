FactoryBot.define do
  factory :recipe do
    name { Faker::Food.dish }
    recipe { Faker::Food.description }
  end
end
