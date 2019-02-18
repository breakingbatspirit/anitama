class CdsController < ApplicationController
  def new
    @cd = Cd.new
    @disc = @cd.discs.build
    @song = @disc.songs.build
    @anime = Anime.new
    @label = Label.new
    @artist = Artist.new

    @animes = Anime.all.order("anime_title")
    @labels = Label.all.order("label_name")
    @artists = Artist.all.order("artist_name")
  end

  def index
    @cds = Cd.all
  end

  def show
    @chats = Chat.all
    @user = current_user
    @cd = Cd.find(params[:id])
  end

  def edit
  end

  def create
    @cd = Cd.new(cd_params)
    # @anime = anime.find(5)
    if @cd.save
        # d.song.id
      flash[:notice] = "Success message: 新しいCDが商品情報に追加されました！"
      redirect_to new_cd_path
    else
      flash[:notice] = "Error message: エラー発生！"
      redirect_to new_cd_path
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
    @cds = Cd.all
  end

  private

    def cd_params
      params.require(:cd).permit(:id, :cd_image_id, :album, :inventory, :price, :anime_id, :label_id, :genre_id, discs_attributes: [:id, :disc_number, :_destroy,
                                                                                                                 songs_attributes: [:id, :order, :title, :artist_id, :_destroy]])
      # ストロングパラメーターの _destroy も必要（入れないと削除できない）
      # 子要素は親要素のストロングパラメーターに含めて記述できる
    end

end
