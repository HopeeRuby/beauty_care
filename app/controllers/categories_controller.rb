# frozen_string_literal: true

class CategoriesController < ApplicationController
  include BreadcrumbsOnRails::ActionController

  before_action :set_category, only: %i[show edit update destroy]

  add_breadcrumb 'Home', :administrator_root_path
  add_breadcrumb 'Categories', :categories_path

  def index
    @categories = Category.all
    if params[:search].present?
      @categories = @categories.where('title LIKE ? OR description LIKE ?',
                                      "%#{params[:search]}%", "%#{params[:search]}%")
    end
    @categories = @categories.paginate(page: params[:page], per_page: 10)
  end

  def show
    add_breadcrumb 'Products list'
  end

  def new
    add_breadcrumb 'Add new category'
    @category = Category.new
  end

  def edit
    add_breadcrumb 'Edit category'
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = I18n.t('flash.category.success.create')
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def update
    add_breadcrumb 'Edit category'
    if @category.update(category_params)
      flash[:success] = I18n.t('flash.category.success.update')
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end

  def destroy
    if @category.products.empty?
      @category.destroy
      flash[:success] = I18n.t('flash.category.success.destroy')
    else
      flash[:alert] = I18n.t('flash.category.fail.destroy')
    end
    redirect_to categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :description)
  end
end
