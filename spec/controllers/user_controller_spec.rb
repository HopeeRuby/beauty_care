require 'rails_helper'
require 'faker'
RSpec.describe UsersController, type: :controller do
  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
    it "assigns @user" do
      @company = Company.new(name: Faker::Name.name, location: Faker::Nation.capital_city)
      @company.save!
      @user = User.new(name: Faker::Name.name, email: Faker::Internet.email, active: 1, company_id: @company.id)
      @user.save!
      get :index
      expect(assigns(:users)).to eq([@user])
    end
  end
end