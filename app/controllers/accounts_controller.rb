class AccountsController < ApplicationController
	# http post
	def index
	end

  def show
  end

  # http post
  def create
  	@account = Account.new account_params
  	if @account.save
      flash[:success] = "Register success"
      redirect_to account_path
    else
    	flash[:success] = "Register failed"
      render :new
    end
  end
    
  # http get
  def new
  	@account = Account.new
  end

  # http get
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
  		account_params.require(:account).permit :name, :password, :user_id, :post_id
  	end
end
