# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    price { Faker::Commerce.price(range: 10..100) }
    quantity { Faker::Number.between(from: 1, to: 100) }
    status { ['active', 'deactive'].sample }
    association :product_category, factory: :product_category
  end
end
