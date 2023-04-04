class CompaniesController < ApplicationController
  # http get
  def index
    @companies = Company.all.page(params[:page]).per_page 10
  end

  # http post
  def create
    @company = Company.create(company_params)
    redirect_to companies_path
  end
  
  # http get
  def new
    @company = Company.new
  end

  # http get
  def edit
  end

  # http get
  def show
    @company = Company.find(params[:id])
  end

  # http put/patch
  def update
  end

  # http delete
  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    redirect_to companies_path
  end

  private
  def company_params
    params.require(:company).permit(:name, :location)
  end
end
