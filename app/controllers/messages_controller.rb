class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
  end
  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    #チャットルームに紐づいたメッセージのインスタンス生成。message_paramsを引数にしてprivateメソッド呼び出し。
    if @message.save
      redirect_to room_messages_path(@room)
      #@roomで指定したroom_messages_pathへリダイレクト。
    else
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
    #messageキー(モデル)探す→contentキーを許可→許可するパラメータにcurrent_user.idも追加
  end
end
