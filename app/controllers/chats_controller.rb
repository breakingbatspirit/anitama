class ChatsController < ApplicationController

	def create
		cd = Cd.find(params[:cd_id])
		chat.cd_id = cd.id
		@chat = current_user.chat.new(chat_params)
		chat.save
		redirect_to cd_path(cd.id)
	end

	def destroy

	end

	private
	def chat_params
		params.require(:chat).permit(:body,:cd_id,:user_id)
	end

end
