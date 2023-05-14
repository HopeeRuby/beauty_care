# frozen_string_literal: true

class ProductCategoriesController < ApplicationController
  include BreadcrumbsOnRails::ActionController

  before_action :set_product_category, only: %i[show edit update destroy]

  add_breadcrumb 'Home', :administrator_root_path
  add_breadcrumb 'Product_Categories', :product_categories_path

  def index
    @product_categories = ProductCategory.all
    if params[:search].present?
      @product_categories = @product_categories.where('title LIKE ? OR description LIKE ?',
                                      "%#{params[:search]}%", "%#{params[:search]}%")
    end
    @product_categories = @product_categories.paginate(page: params[:page], per_page: 10)
  end

  def show
    add_breadcrumb 'Products list'
  end

  def new
    add_breadcrumb 'Add new product_category'
    @product_categories = ProductCategory.new
  end

  def edit
    add_breadcrumb 'Edit category'
  end

  def create
    @product_category = ProductCategory.new(category_params)
    if @product_category.save
      flash[:success] = I18n.t('flash.product_category.success.create')
      redirect_to product_categories_path
    else
      render 'new'
    end
  end

  def update
    add_breadcrumb 'Edit category'
    if @product_category.update(category_params)
      flash[:success] = I18n.t('flash.product_category.success.update')
      redirect_to product_category_path(@product_category)
    else
      render 'edit'
    end
  end

  def destroy
    if @product_category.products.empty?
      @product_category.destroy
      flash[:success] = I18n.t('flash.product_category.success.destroy')
    else
      flash[:alert] = I18n.t('flash.product_category.fail.destroy')
    end
    redirect_to product_categories_path
  end

  private

  def set_product_category
    @product_category = ProductCategory.find(params[:id])
  end

  def product_category_params
    params.require(:product_category).permit(:name, :description)
  end
end
