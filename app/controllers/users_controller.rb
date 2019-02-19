class UsersController < ApplicationController
   before_action :admin_validate!, only: [:index]
    PER = 8
  def index

    @search = User.ransack(params[:q])
    @users = @search.result.with_deleted
    @users_page = @users.page(params[:page]).per(PER).reverse_order
    # binding.pry
  end


  def show
    admin = User.find(1)
    if current_user.id != admin.id
      @user = current_user
    else
      @user = User.all.with_deleted.find(params[:id])
    end
  end

  def edit
#   Ransack用
    @search = User.ransack(params[:q])
#   Ransack用ここまで

    admin = User.find(1)
    if current_user.id != admin.id
      @user = current_user
    else
      @user = User.all.with_deleted.find(params[:id])
    end
  end


  def create
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  def delete
    user = User.find(params[:id])
    user.update(user_params)
    admin = User.find(1)
    puts admin
    puts user.id != admin.id
    if current_user.nil?
      redirect_to root_path
      # ログインユーザーがnilならトップページ
    else
      redirect_to users_path
      # ログインユーザーがnilじゃなければユーザー一覧
    end
  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:name, :namekana, :nickname, :image, :postal, :address, :phone, :email, :deleted_at)
    end

    def admin_validate!
      admin = User.find(1)
      if current_user != admin
        redirect_to user_path(current_user)
      end
    end

end