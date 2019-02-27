class CdsController < ApplicationController
  before_action :admin_validate!, only: [:index,:new,:edit]
  PER = 3
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
    @cds = Cd.search(params[:search])
    @cd = Cd.page(params[:page]).per(PER)
  end

  def show
    @user = current_user
    @cd = Cd.find(params[:id])
    @chats = @cd.chats.order(created_at: "desc")
    @cdsnew = Cd.all
    # @chats = Chat.where(cd_id: params[:id])
    @cds = Cd.search(params[:search])
    @cart = CartItem.new
    if user_signed_in?
      @favorite = current_user.favorite_cds.order(id: "desc")
    end
   end


  def edit
    @cd = Cd.find(params[:id])
    @disc = Disc.find(params[:id])
    @song = Song.find(params[:id])

    @animes = Anime.all
    @labels = Label.all
    @artists = Artist.all
  end

  def create
    @cd = Cd.new(cd_params)
    # @anime = anime.find(5)
    if @cd.save
        # d.song.id
      flash[:notice] = "Success message: 新しいCDが商品情報に追加されました！"
      redirect_to new_cd_path
    else
      p @cd.errors.full_messages
      flash[:notice] = "Error message: エラー発生！"
      redirect_to new_cd_path
    end

  end

  def update
    @cd = Cd.find(params[:id])
    if @cd.update(cd_params)
      flash[:notice] = "数量が更新されました！"
      redirect_to cds_path
    else
      render 'edit'
    end
  end

  def destroy
    @cd = Cd.find(params[:id])
    @cd.destroy
    redirect_to cds_path
  end

  def top
    @cd = Cd.find(params[:id])
    @cds = Cd.all
    @user = current_user
  end

  # def search
  # end

def result
    @anime = Anime.all
    @user = current_user
    # @search = Cd.ransack(params[:q])
    # @cds = @search.result(distinct: true)
    if params[:search]
       @cds = Cd.search(params[:search])
       @cds = Kaminari.paginate_array(@cds).page(params[:page]).per(PER)
    else
       @cds = Cd.page(params[:page]).per(PER)
    end
  end

  def top
    @cds = Cd.all
    if user_signed_in?
      @user = current_user
      @favorite = current_user.favorite_cds
    end
  end


  private

    def cd_params
      params.require(:cd).permit(:id, :cd_image, :album, :inventory, :price, :anime_id, :label_id, :genre_id, discs_attributes: [:id, :disc_number, :_destroy,
                                                                                                                 songs_attributes: [:id, :order, :title, :artist_id, :_destroy]])
      # ストロングパラメーターの _destroy も必要（入れないと削除できない）
      # 子要素は親要素のストロングパラメーターに含めて記述できる
      # ストロングパラメーターのcd_imageには_id不要
    end
    def admin_validate!
      admin = User.find(1)
      if current_user != admin
        redirect_to root_path
      end
    end

end
