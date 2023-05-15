# frozen_string_literal: true

require 'factory_bot'
require 'faker'
include FactoryBot::Syntax::Methods
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
5.times do 
  create(:admin)
end

# 20.times do 
#   create(:user)
# end

5.times do
  product_category = FactoryBot.create(:product_category)
  5.times do
    FactoryBot.create(:product, product_category: product_category)
  end
end
