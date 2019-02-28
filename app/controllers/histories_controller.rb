class HistoriesController < ApplicationController
  before_action :admin_validate!, only: [:index]
  PER = 3
  def index
    if params[:search]
      @histories  = History.search(params[:search])
      @histories = Kaminari.paginate_array(@histories).page(params[:page]).per(PER)
    else
      @histories = History.page(params[:page]).per(PER)
    end
  end

  def create
    user = current_user
    @cart_items = user.cart_items
    history = History.new

      history.histories_name = user.addresses[-1].address_name
      history.histories_namekana = user.addresses[-1].address_namekana
      history.histories_postal = user.addresses[-1].address_postal
      history.histories_address = user.addresses[-1].address_address
      history.histories_phone = user.addresses[-1].address_phone
      history.user_id = user.id

    history.save

    @cart_items.each do |cart_item|
          # HistoryCd.new したカラムの history_id に Historyの[:id] を入力
      history_cd = HistoryCd.new
        history_cd.history_id = history.id
        history_cd.cd_id = cart_item.cd.id
        history_cd.history_cd_quantity = cart_item.unit_quantity
        history_cd.history_cd_price = cart_item.cd.price
        history_cd.history_cd_album = cart_item.cd.album
      history_cd.save
    end

    user.cart_items.each do |cart_item|
      @inventory = cart_item.cd.inventory - cart_item.unit_quantity
      cart_item.cd.update(inventory: @inventory)

    end

    CartItem.delete_all

    redirect_to user_path

    # else
      # render 'cart_items/show'
    # end
  end

  def destroy
  end

  def update
    history = History.find(params[:id])
    if history.update(history_params)
      redirect_to histories_path, notice: 'History was successfully updated.'
    else
      render 'index'
    end
  end

  private

  def history_params
    params.require(:history).permit(:status,:histories_name,:histories_namekana,:histories_postal,:histories_address,:histories_phone,:user_id)
  end
  def admin_validate!
      admin = User.find(1)
      if current_user != admin
        redirect_to root_path
      end
    end

end
