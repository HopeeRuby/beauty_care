require 'rails_helper'
require 'faker'
FactoryBot.define do
  factory :user do
    company = Company.create(name: Faker::Name.name, location: Faker::Nation.capital_city)
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'password' }
    company.id
  end
end
RSpec.describe User, type: :model do
  describe 'Validations' do
  #   it "is valid with valid attributes" do
  #     company = Company.create(name: Faker::Name.name, location: Faker::Nation.capital_city)
  #     user = User.new(name: Faker::Name.name, email: Faker::Internet.email, active: true, company_id: company.id)
  #     expect(user).to be_valid
  #   end

  #   it "is not valid without a name" do
  #     user = User.new(email: Faker::Internet.email, active: true)
  #     expect(user).to_not be_valid
  #   end

  #   it "is not valid without an email" do
  #     user = User.new(name: Faker::Name.name, active: true)
  #     expect(user).to_not be_valid
  #   end

  #   it "is not valid without a company_id" do
  #     company = Company.create(name: Faker::Name.name, location: Faker::Nation.capital_city)
  #     user = User.new(name: Faker::Name.name, email: Faker::Internet.email, active: true)
  #     expect(user).to_not be_valid
  #   end
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password).on(:create) }
    it { should validate_length_of(:password).is_at_least(6) }

  describe 'Associations' do
    it { should belong_to(:company) }
    it { should have_many(:posts).dependent(:destroy) }
  end

  describe 'Nested Attributes' do
    it { should accept_nested_attributes_for(:profile).allow_destroy(true).update_only(true) }
    it { should accept_nested_attributes_for(:posts).allow_destroy(true) }
  end

  describe 'Callbacks' do
    it 'removes whitespaces from name before validation' do
      user = FactoryBot.build(:user, name: '    abcscs  ')
      user.valid?
      expect(user.name).to eq('abcscs')
    end

    it 'logs validation status after validation' do
      user = FactoryBot.build(:user)
      expect(Rails.logger).to receive(:info).with("User #{user.id} validate")
      user.valid?
    end
  end
  # describe "associations" do
  #   it "belongs to a company" do
  #     company = Company.create(name: Faker::Name.name, location: Faker::Nation.capital_city)
  #     user = User.create(name: Faker::Name.name, email: Faker::Internet.email, active: true, company_id: company.id)
  #     expect(user.company).to eq(company)
  #   end  
  end
end
