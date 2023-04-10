require 'rails_helper'

describe Product do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    # it 'validates name not blank' do
    #   product = described_class.new
    #   product.valid?

    #   expect(product.errors.full_messages).include? ('name is blank')
    # end
  end

  describe 'associations' do
    # it { should belong_to(:category).class_name('MenuCategory') }
  end

  describe 'methods' do
    # describe '#expensive?' do
    #   context 'with price > 10000' do
    #     let(:product) { Product.create(price: 10000) }

    #     it 'returns true' do
    #       expect(product.expensive?).to eq true
    #     end
    #   end

    #   context 'with price <= 10000' do
    #     let(:product) { Product.create(price: 9000) }

    #     it 'returns false' do
    #       expect(product.expensive?).to eq false
    #     end
    #   end
    # end
  end
end
