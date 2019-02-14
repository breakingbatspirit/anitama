class UsersController < ApplicationController
  def index
    
    @search = User.ransack(params[:q])
    @users = @search.result
    @users = User.page(params[:page]).reverse_order
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def create
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(current_user)
  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:name, :namekana, :nickname, :image, :postal, :address, :phone, :email)
    end
end
