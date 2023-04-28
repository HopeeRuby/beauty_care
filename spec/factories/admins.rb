# frozen_string_literal: true

FactoryBot.define do
  factory :admin do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone { '1111222233' }
    email { Faker::Internet.email }
    status { 'active' }
    role { 'admin' }
    password { Faker::Internet.password(min_length: 6, max_length: 20) }
  end
end
