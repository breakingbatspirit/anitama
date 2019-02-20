class CartItemsController < ApplicationController
  def index
  	@search = User.ransack(params[:q])

  end

  def show
    @user = current_user
    @cd = Cd.find(params[:id])
    @search = Cd.ransack(params[:q])
  end

  def create
    binding.pry
    @cart_item = CartItem.new(cart_item_params)
  end

  def destroy
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:user_id, :cd_id, :unit_quantity)
  end

end
