class ChatsController < ApplicationController

	def create

	end

	def destroy
		chat = Chat.find(params[:id])
		chat.destroy
		redirect_to cd_path(params[:cd_id])

	end

end
