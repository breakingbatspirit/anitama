class CdsController < ApplicationController
  def new
    @cd = Cd.new
    @disc = @cd.discs.build
    @song = @disc.songs.build
  end

  def index
    @cd = Cd.all
  end

  def show
  end

  def edit
  end

  def create
    @cd = Cd.new(cd_params)
    if @cd.save
      flash[:notice] = "Success message: 新しいCDが商品情報に追加されました！"
      redirect_to cds_path
    end
  end

  def update
  end

  def destroy
    @cd = Cd.find(params[:id])
    @cd.destroy
    redirect_to cds_path
  end

  def result
  end

  def top
  end

  private

    def cd_params
      params.require(:cd).permit(:cd_image_id, :album, :price, :inventory, discs_attributes: [:id, :_destroy, songs_attributes: [:id, :order, :title, :artist]])
      # ストロングパラメーターの _destroy も入れておく必要がある（入れないと削除できない）
      # 子要素は親要素のストロングパラメーターに含めて記述できる
    end
end
