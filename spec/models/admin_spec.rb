# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin, type: :model do
  subject { build(:admin) }

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:phone) }
    it { should validate_length_of(:phone).is_equal_to(10) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should allow_value('test@example.com').for(:email) }
    it { should_not allow_value('test').for(:email) }
  end

  describe 'enums' do
    it { should define_enum_for(:status).with_values(active: 0, inactive: 1) }
    it { should define_enum_for(:role).with_values(admin: 0, customer_service: 1) }
  end

  describe '#active_for_authentication?' do
    context 'when admin is active' do
      let(:admin) { create(:admin, status: :active) }

      it 'returns true' do
        expect(admin.active_for_authentication?).to eq(true)
      end
    end

    context 'when admin is inactive' do
      let(:admin) { create(:admin, status: :inactive) }

      it 'returns false' do
        expect(admin.active_for_authentication?).to eq(false)
      end
    end
  end
  describe 'callbacks' do
    context 'when saving an admin' do
      let(:admin) { create(:admin, email: 'NGOCANH@GMAIL.COM', phone: 1234567890) }

      it 'downcases the admin email' do
        expect(admin.email).to eq('ngocanh@gmail.com')
      end

      it 'converts the admin phone to a string' do
        expect(admin.phone).to eq('123456789')
      end
    end
  end
end
