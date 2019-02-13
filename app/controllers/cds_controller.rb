class CdsController < ApplicationController
  def new
    @disc = Disc.new
  end

  def index
    @disc = Disc.new
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
    cd = Cd.find(params[:id])
    parent.destroy
    redirect_to '#'
  end

  def result
  end

  def top
  end
end
