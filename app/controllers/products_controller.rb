class ProductsController < ApplicationController
  def index
    @products = Product.paginate(page: params[:page])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path, notice: 'create successfully'
    else
      render :new, notice: 'create fail'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to products_path, notice: 'update successfully'
    else
      render :edit, notice: 'update fail'
    end
  end

  def destroy
    @product = Product.find(params[:id])

    if @product.destroy
      redirect_to products_path, notice: 'delete successfully'
    else
      redirect_to products_path, notice: 'delete fail'
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :quantity, :price)
  end
end
