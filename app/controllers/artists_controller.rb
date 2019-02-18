class ArtistsController < ApplicationController


	def create
        @artist = Artist.new(artist_params) unless @artist
        @artist.save
        redirect_to new_cd_path
	end

	def update
	end

	def destroy
	end

    def artist_params
        params.require(:artist).permit(:artist_name)
    end
end
