require 'rails_helper'
require 'carrierwave/test/matchers'

RSpec.describe Admin, type: :model do
  subject { build(:admin) }

  let(:admin) { create(:admin, phone: "1234567890", status: "active", role: "admin") }
  let(:admin_attributes) { attributes_for(:admin) }

  describe 'validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should allow_value('test@example.com').for(:email) }
    it { should validate_presence_of(:phone) }
    it { should allow_value('1234567890').for(:phone) }
    it { should_not allow_value('abc').for(:phone) }
  end

  describe 'enums' do
    it { should define_enum_for(:status).with_values(active: 0, inactive: 1) }
    it { should define_enum_for(:role).with_values(admin: 0, customer_service: 1) }
  end

  describe '#active_for_authentication?' do
    context 'when admin is active' do
      let(:admin) { create(:admin, phone: "1234567890", status: "active", role: "admin") }
      
      it 'returns true' do
        expect(admin.active_for_authentication?).to eq(true)
      end
    end

    context 'when admin is inactive' do
      let(:admin_inactive) { create(:admin, status: :inactive, phone: "1234567890") }

      it 'returns false' do
        expect(admin_inactive.active_for_authentication?).to eq(false)
      end
    end
  end

  describe 'callbacks' do
    context 'when saving an admin' do
      let(:admin) { build(:admin, email: 'HONGTHAM@GMAIL.COM', phone: 1234567890) }
      before(:each) do
        admin.save!
      end

      it 'downcases the admin email' do
        expect(admin.email).to eq('hongtham@gmail.com')
      end

      it 'converts the admin phone to a string' do
        expect(admin.phone).to eq('1234567890')
      end
    end
  end 

  describe 'AvatarUploader' do
    include CarrierWave::Test::Matchers
    let(:uploader) { AvatarUploader.new(admin, :avatar) }
    before do
      @existing_directories = Dir.glob("#{Rails.public_path}/uploads/admin/avatar/*")
      AvatarUploader.enable_processing = true # turn on image processing mode to test
      File.open(Rails.root.join('spec', 'support', 'test.jpg')) do |f|
        uploader.store!(f)
      end
    end

    after do
      AvatarUploader.enable_processing = false # turn off image processing mode
      Dir.glob("#{Rails.public_path}/uploads/admin/avatar/*").each do |file_path|
        if !@existing_directories.include?(file_path)
          FileUtils.rm_rf(file_path)
        end
      end
    end

    context 'the medium version' do
      it 'should scale down a landscape image to be exactly 250 by 250 pixels' do
        expect(uploader.medium).to have_dimensions(250, 250)
      end
    end

    context 'the small version' do
      it 'should scale down a landscape image to be exactly 50 by 50 pixels' do
        expect(uploader.small).to have_dimensions(50, 50)
      end
    end

    context 'the default version' do
      it 'returns the correct default image path' do
        expect(uploader.default_url).to include(Rails.application.assets.find_asset('fallback/small_default.png').digest_path)
      end
    end

    context 'the extension_allowlist' do
      it 'should only allow jpg, jpeg, gif and png extensions' do
        expect(uploader.extension_allowlist).to include('jpg', 'jpeg', 'gif', 'png')
      end
    end

    context 'the size_range' do
      it 'should allow files with size up to 2MB' do
        expect(uploader.size_range).to include(1..(2.megabytes))
      end
    end
  end
end
