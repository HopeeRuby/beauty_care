require 'rails_helper'
require 'faker'
FactoryBot.define do
  factory :user do
    company = Company.create(name: Faker::Name.name, location: Faker::Nation.capital_city)
    name { Faker::Name.name }
    email { Faker::Internet.email }
    company.id
  end
end
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

  describe 'GET #new' do
    it 'assigns a new user as @user' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new user' do
        expect {
          post :create, params: { user: FactoryBot.attributes_for(:user) }
        }.to change(User, :count).by(1)
      end

      it 'assigns a newly created user as @user' do
        post :create, params: { user: FactoryBot.attributes_for(:user) }
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it 'redirects to the created user' do
        post :create, params: { user: FactoryBot.attributes_for(:user) }
        expect(response).to redirect_to(User.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved user as @user' do
        post :create, params: { user: FactoryBot.attributes_for(:user, name: nil) }
        expect(assigns(:user)).to be_a_new(User)
      end

      it 're-renders the new template' do
        post :create, params: { user: FactoryBot.attributes_for(:user, name: nil) }
        expect(response).to render_template(:new)
      end
    end
  end
end
