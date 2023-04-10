require 'rails_helper'
require 'faker'
RSpec.describe User, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      company = Company.create(name: Faker::Name.name, location: Faker::Nation.capital_city)
      user = User.new(name: Faker::Name.name, email: Faker::Internet.email, active: true, company_id: company.id)
      expect(user).to be_valid
    end

    it "is not valid without a name" do
      user = User.new(email: Faker::Internet.email, active: true)
      expect(user).to_not be_valid
    end

    it "is not valid without an email" do
      user = User.new(name: Faker::Name.name, active: true)
      expect(user).to_not be_valid
    end

    it "is not valid without a company_id" do
      company = Company.create(name: Faker::Name.name, location: Faker::Nation.capital_city)
      user = User.new(name: Faker::Name.name, email: Faker::Internet.email, active: true)
      expect(user).to_not be_valid
    end
  end

  describe "associations" do
    it "belongs to a company" do
      company = Company.create(name: Faker::Name.name, location: Faker::Nation.capital_city)
      user = User.create(name: Faker::Name.name, email: Faker::Internet.email, active: true, company_id: company.id)
      expect(user.company).to eq(company)
    end
  end
end