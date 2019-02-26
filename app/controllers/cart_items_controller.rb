class CartItemsController < ApplicationController
  def index
    @user = current_user
    # where=条件に合うすべてのコードを取得する-----
    @carts= current_user.cart_items
  # カート内商品の合計を表示----↓
  	@cart = CartItem.new
    #カート内商品合計金額表示----↓
    # arrayで[]の中の要素を取り出す
    array = []
    @carts.each do |cart|
     shokei =  cart.cd.price * cart.unit_quantity
     array << shokei
    # cartの中のcdのpriceをarrayにpushする
    end
    @total_price = array.sum
    # array.sumを@total_priceに代入
    # @total_priceをviweに記述する。
    # -----------------------------
    @cds =Cd.new
    # @user = User.find(params[:id])
    # @cart_item = @user.cart_item.page(params[:page]).reverse_order



  end

  def show
    @user = current_user
    # @cd = Cd.find(params[:id])

    # @cart_item = CartItem.find(params[:id])
    @cart_items = CartItem.all

    @search = Cd.ransack(params[:q])

    @address = Address.new
    @addresses = @user.addresses[-1]

    @history = History.new

    @user = current_user
    @carts = CartItem.all
    @search = User.ransack(params[:q])
    @cart = CartItem.new

    #カート内商品合計金額表示----↓
    # arrayで[]の中の要素を取り出す
    array = []
    @carts.each do |cart|
      array.push(cart.cd.price)
    # cartの中のcdのpriceをarrayにpushする
    end
    @total_price = array.sum
    # array.sumを@total_priceに代入
    # @total_priceをviweに記述する。
    # -----------------------------

    @cds = Cd.new

    # user = current_user
    # address = Address.user
    # @addresses = Address.find(params[:id])
  end

   def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
   end

  def create
  	cart = CartItem.new(cart_item_params)
  	user = current_user
  	cart.user_id = user.id
  	cart.save
  	redirect_to carts_path(user.id)
    @cart_item = CartItem.new(cart_item_params)
  end

  def destroy
    # if controller.action_name == "index"
      cart = CartItem.find(params[:id])
      cart.destroy
      redirect_to carts_path(current_user.id)
    # else
      # @carts = CartItem.all.destory
    # end
  end



 private
 def cart_item_params
 	params.require(:cart_item).permit(:user_id,:cd_id,:unit_quantity)
 end

end