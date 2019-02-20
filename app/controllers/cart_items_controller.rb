class CartItemsController < ApplicationController
  def index
  	@user = current_user
  	@carts = CartItem.all
  	@search = User.ransack(params[:q])
  	@cart = CartItem.new

  end

  def show
  	@search = User.ransack(params[:q])
  	@user = current_user
  end

  def create
  	cart = CartItem.new(cart_item_params)
  	user = current_user
  	cart.user_id = user.id
  	cart.save
  	redirect_to carts_path
  end

  def destroy
  	cart = CartItem.find(params[:id])
	cart.destroy
	redirect_to carts_path
  end



 private
 def cart_item_params
 	params.require(:cart_item).permit(:unitquantity,:cd_id,:user_id)
 end




end