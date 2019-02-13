class SongsController < ApplicationController

	def create
        @song = Song.new(song_params)
        @song.save
	end

	def destroy
        @song = Song.find(params[:id])
        @song.destroy
	end

	def update
	end

    private
        def song_params
            params.require(:song).permit(:order, :title, :artist)
        end
end