# frozen_string_literal: true

require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
3.times do |_company|
  new_company = Company.create(name: Faker::Company.name, location: Faker::Nation.capital_city)
  2.times do |_user|
    new_user = User.create(name: Faker::Name.name, company_id: new_company.id)
    2.times do |_post|
      Post.create(title: Faker::Job.title, content: Faker::Job.field, user_id: new_user.id)
    end
  end
end
