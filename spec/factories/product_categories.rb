# frozen_string_literal: true

FactoryBot.define do
  factory :product_category do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    status { ['active', 'inactive'].sample }
  end
end
