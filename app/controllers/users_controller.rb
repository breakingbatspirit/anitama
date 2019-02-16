class UsersController < ApplicationController
  before_action :auth_validate!,only: [:show, :edit]
  before_action :admin_validate!, only: [:index, :delete]
   PER = 8
  def index

    @search = User.ransack(params[:q])
    @users = @search.result

    @users = @search.result.with_deleted
    @users_page = @users.page(params[:page]).per(PER).reverse_order
    # binding.pry
  end


  def show
    @user = User.all.with_deleted.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def create
  end
# ユーザー用
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to root_path
  end

# //管理者
  def delete
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to users_path
  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:name, :namekana, :nickname, :image, :postal, :address, :phone, :email, :deleted_at)
    end

    def auth_validate!
      user = User.all.with_deleted.find(params[:id])
      if current_user.id != user.id
        redirect_to user_path(current_user)
      end
    end

    def admin_validate!
      admin = User.find(2)
      if current_user != admin
        redirect_to user_path(current_user)
      end
    end

end
