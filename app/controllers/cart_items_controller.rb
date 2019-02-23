class CartItemsController < ApplicationController
  def index
  	@user = current_user
  	@carts = CartItem.all
  	@search = User.ransack(params[:q])

  	@cart = CartItem.new

  end

  def show
    @user = current_user
    @cd = Cd.find(params[:id])
    @search = Cd.ransack(params[:q])
  end

  def create
    binding.pry
  	cart = CartItem.new(cart_item_params)
  	user = current_user
  	cart.user_id = user.id
  	cart.save
  	redirect_to carts_path
    @cart_item = CartItem.new(cart_item_params)
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

