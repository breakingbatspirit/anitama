class HistoriesController < ApplicationController
  PER = 3
  def index
    @history_cds = HistoryCd.all
    @histories = History.search(params[:search])
    # @search = History.ransack(params[:q])
    # @histories1 = @search

    # @search = History.ransack(params[:q])
    # @histories = @search.result
    # @histories_page = @histories.page(params[:page]).per(PER).reverse_order
  end

  def create
    @cart_items = CartItem.all

    user = current_user

    # if @history = user.histories.create(history_params)

      history = History.new

      addresses = Address.all

      history.histories_name = user.addresses[-1].address_name
      history.histories_namekana = user.addresses[-1].address_namekana
      history.histories_postal = user.addresses[-1].address_postal
      history.histories_address = user.addresses[-1].address_address
      history.histories_phone = user.addresses[-1].address_phone
      history.user_id = user.id

      history.save

      # History.newしたカラムのuser_id に current_userの[:id] を入力
      history.user_id = user.id

      cd = Cd.all

      # CartItem.all で呼んでる複数レコードの情報をeachで回しますよ〜
      @cart_items.each do |cart_item|
        history_cd = HistoryCd.new
        puts history_cd.errors.full_messages

        # HistoryCd.new したカラムの history_id に Historyの[:id] を入力
        history_cd.history_id = history.id
        history_cd.cd_id = cart_item.cd.id
        history_cd.history_cd_quantity = cart_item.unit_quantity
        history_cd.history_cd_price = cart_item.cd.price
        history_cd.history_cd_album = cart_item.cd.album

        history_cd.save
      end

      CartItem.delete_all

      redirect_to root_path

    # else
    #   render 'cart_items/show'
    # end

  end

  def destroy
  end

  private

  def history_params
    params.require(:history).permit(:status,:histories_name,:histories_namekana,:histories_postal,:histories_address,:histories_phone,:user_id)
  end

end
