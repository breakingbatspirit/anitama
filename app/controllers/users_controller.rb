class UsersController < ApplicationController
  def index
  @search = User.ransack(params[:q])
  @users = @search.result
  end

  def show
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

end
