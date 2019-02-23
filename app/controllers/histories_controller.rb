class HistoriesController < ApplicationController
  def index
  end

  def create
    if @history = current_user.histories.create(history_params)
      redirect_to histories_path
    else
      binding.pry
      render 'cart_items/show'
    end
  end

  def destroy
  end

  private

  def history_params
    params.require(:history).permit(:status,:histories_name,:histories_namekana,:histories_postal,:histories_address,:histories_phone,:user_id)
  end

end
