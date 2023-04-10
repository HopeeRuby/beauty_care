require 'rails_helper'

describe ProductsController, type: :controller do
  # describe '#index' do
  #   let!(:product) { Product.create(name: "product 11", description: "description aa", quantity: 1, price: 1, public: false) }

  #   it 'returns list of product' do
  #     get :index

  #     expect(response.status).to eq 200
  #     expect(assigns(:products).size).to eq 0
  #     expect(assigns(:products).first.name).to eq 'product 11'
  #     expect(assigns(:products).map(&:id)).to eq [product.id]
  #     expect(response).to render :index
  #     expect(response).to redirect_to :index
  #   end
  # end
end

# describe ProductService do
#   describe '#decrease_warehouse' do
#     let(:warehouse) {}
    
#     it 'decreases to 1' do
#       ProductService.new.decrease_warehouse

#       expect(Warehouse.count).to eq 0
#     end
#   end
# end
