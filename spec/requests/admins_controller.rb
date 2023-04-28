# frozen_string_literal: true

require 'rails_helper'
include AuthHelper

RSpec.describe Administrator::AdminsController, type: :controller do
  # admin with role admin
  let(:admin) { create(:admin) }
  let(:admin_attributes) { attributes_for(:admin) }

  # admin with role customer_service
  let(:admin_customer_service) do
    Admin.create(
      id: 10,
      first_name: 'khoa',
      last_name: 'vu',
      phone: '0935167890',
      status: 'active',
      role: 'customer_service',
      email: 'khoa4@gmail.com'
    )
  end
  let(:admin_customer_service_attributes) { attributes_for(:admin_customer_service) }

  describe 'GET admins#index' do
    context 'when login as an admin role' do
      before(:each) do
        sign_in admin
      end

      it 'renders index template' do
        get :index
        expect(response).to render_template(:index)
      end

      it 'returns http success' do
        get :index
        expect(response).to have_http_status(200)
      end
    end

    context 'when login as an customer_service role' do
      before(:each) do
        sign_in admin_customer_service
      end

      it 'does not render index template' do
        expect((get :index)).to_not render_template('index')
      end
    end
  end

  describe 'GET admins#show' do
    context 'when login as an admin role' do
      before(:each) do
        sign_in admin
      end

      it 'renders show template' do
        get :show, params: { id: admin.id }
        expect(response).to render_template(:show)
      end

      it 'returns http success' do
        get :show, params: { id: admin.id }
        expect(response).to have_http_status(200)
      end
    end

    context 'when login as an customer_service role' do
      before(:each) do
        sign_in admin_customer_service
      end

      it 'does not render show template' do
        # binding.pry
        expect((get :show, params: { id: admin_customer_service.id })).to_not render_template('show')
      end
    end
  end

  describe 'GET admins#new' do
    context 'when login as an admin role' do
      before(:each) do
        sign_in admin
      end

      it 'returns http success' do
        get :new
        expect(response).to have_http_status(200)
      end
    end

    context 'when login as an customer_service role' do
      before(:each) do
        sign_in admin_customer_service
      end

      it 'does not render new template' do
        expect((get :new)).to_not render_template('new')
      end
    end
  end

  describe 'GET admins#edit' do
    context 'when login as an admin role' do
      before(:each) do
        sign_in admin
      end

      it 'returns http success' do
        get :edit, params: { id: admin.id }
        expect(response).to have_http_status(200)
      end
    end

    context 'when login as an customer_service role' do
      before(:each) do
        sign_in admin_customer_service
      end

      it 'does not render edit template' do
        expect((get :edit, params: { id: admin_customer_service.id })).to_not render_template('edit')
      end
    end
  end

  describe 'DELETE admins#destroy' do
    context 'when login as an admin role' do
      before(:each) do
        sign_in admin
      end

      it 'destroys the admin' do
        admin = create(:admin)
        expect { delete :destroy, params: { id: admin.id } }.to change(Admin, :count).by(-1)
      end

      it 'redirects to the admins#index' do
        delete :destroy, params: { id: admin.id }
        expect(response).to redirect_to(administrator_admins_path)
      end
    end

    context 'when login as an customer_service role' do
      before(:each) do
        sign_in admin_customer_service
      end
    end
  end

  describe 'POST admins#create' do
    context 'when login as an admin role' do
      before(:each) do
        sign_in admin
      end

      it 'creates a new admin' do
        expect { post :create, params: { admin: admin_attributes } }.to change(Admin, :count).by(1)
      end

      it 'redirects to the new admin' do
        post :create, params: { admin: admin_attributes }
        expect(response).to redirect_to(administrator_admins_path)
      end
    end

    context 'when login as an customer_service role' do
      before(:each) do
        sign_in admin_customer_service
      end
    end
  end

  describe 'PUT admins#update' do
    context 'when login as an admin role' do
      before(:each) do
        sign_in admin
      end

      it 'updates the admin' do
        put :update, params: { id: admin.id, admin: { first_name: 'Anh' } }
        admin.reload
        expect(admin.first_name).to eq('Anh')
      end

      it 'redirects to the admin' do
        put :update, params: { id: admin.id, admin: { first_name: 'Anh' } }
        expect(response).to redirect_to(administrator_admin_path(admin))
      end
    end

    context 'when login as an customer_service role' do
      before(:each) do
        sign_in admin_customer_service
      end
    end
  end
end
