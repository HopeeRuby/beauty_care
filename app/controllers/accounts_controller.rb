class AccountsController < ApplicationController

  # http post
	def index
	end

  def show
  end

  # http post
  def create
  	@account = Account.new account_params
    if @account.save!
      flash[:success] = "Register success"
      redirect_to accounts_path
    else
      render :new
    end
  end
    
  # http get
  def new
  	@account = Account.new
  end

  # http pget
  def edit
  end

  # http put/patch
  def update
  end

  # http delete
  def destroy
  end

  private
  	def account_params
  		params.require(:account).permit :name, :password
  	end
end
