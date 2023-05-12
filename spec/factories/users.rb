# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone { Faker::PhoneNumber.cell_phone_in_e164 }
    email { Faker::Internet.email }
    address { Faker::Address.state }
    status { ['active', 'inactive'].sample }
    gender { ['male', 'flame'].sample }
    password { Faker::Internet.password(min_length: 6, max_length: 128) }
  end
end
