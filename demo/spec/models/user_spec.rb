require 'rails_helper'

describe User do
  describe 'associations' do
    it { should belong_to(:company) }
    it { should have_many(:posts) }
    it { should have_many(:accounts) }
    it { should have_one(:profile) }
  end

  describe 'validations' do
    before { User.create(name: 'khoa', email: 'kendrick@labadie-conroy.io', company_id: 1) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:name).is_at_most(30) }
    it { should validate_length_of(:email).is_at_most(30) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe 'methods' do

  end

end