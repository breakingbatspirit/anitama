class SongsController < ApplicationController

	def create
        @song = Song.new(song_params)
        @song.save
        redirect_to new_cd_path
	end

	def destroy
        @song = Song.find(params[:id])
        @song.destroy
	end

	def update
        @song = Song.find(params[:id])
        if @song.update(song_params)
            flash[:notice] = "Song has successfully been updated."
        end
	end

    private
        def song_params
            params.require(:song).permit(:order, :title, :artist)
        end
end