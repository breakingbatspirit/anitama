class ChatChannel < ApplicationCable::Channel
  def subscribed
  	# ①-2
  	# フロントエンドとバックエンドが繋がった時に起動する
  	# フロントエンドからデータが来るのを見張っている
    # puts 'params------------------------'
    # puts params
    # puts 'params------------------------'
    stream_from "chat_channel_#{params['cd_id']}"
    # ユーザーが受け取るチャンネル名を指定している
    # chat.js.erbで指定したチャンネルのcd_idをここで取得している。
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    #puts 'data------------------------'
    #puts data
    #puts params
    #puts 'data------------------------'
  	# ④
    puts data
    chat = Chat.create!(body: data['chat'],cd_id: data['cd_id'],user_id: data['user_id'] )
    # viewのchat
    # それぞれのカラムにデータを保存
    # template = ApplicationController.renderer.render(partial: 'chats/chat', locals: {chat: chat})
    user = User.find(data['user_id'])
    template = ApplicationController.render_with_signed_in_user(user, partial:  'chats/chat', locals: { chat: chat })
    ActionCable.server.broadcast "chat_channel_#{params['cd_id']}", template
    # 受け取ったデータをroom.jsにmessageのデータを配信するよということ。
  	# 受け取り先はroom.js内のreceived
  end
end
