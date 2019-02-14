class AnimesController < ApplicationController
  def create
    @anime = Anime.new(anime_params)
    @anime.save
    redirect_to new_cd_path
  end

  private

    def anime_params
      params.require(:anime).permit(:anime_title)
    end
end
