require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
3.times do |company|
  companies = Company.create(name: Faker::Company.name, location: Faker::Nation.capital_city)
  2.times do |user|
    users = User.create(name: Faker::Name.name , company_id: companies.id)
    2.times do |post|
      Post.create(title: Faker::Job.title, content: Faker::Job.field, user_id: users.id)
    end
  end
end