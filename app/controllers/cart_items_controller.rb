class CartItemsController < ApplicationController
  def index
  	@search = User.ransack(params[:q])
    @users = @search.result
  	@user = current_user
  end

  def show
  end

  def create
  end

  def destroy
  end

end
