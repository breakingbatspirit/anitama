class CartItemsController < ApplicationController
  def index
  	@search = User.ransack(params[:q])
   
  end

  def show
  end

  def create
  end

  def destroy
  end

end
