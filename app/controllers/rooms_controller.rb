class RoomsController < ApplicationController
  def index
  end
  def new
    @room = Room.new
  end
  def create
    @room = Room.new(room_params)
    if @room.save #保存成功はroot_pathヘリダイレクト
      redirect_to root_path
    else
      render :new #失敗の場合は、ルーム作成(rooms/new.html.erb)をrenderで引っ張ってくる
    end
  end
  def destroy
    room = Room.find(params[:id]) #削除だからビュー表示不要→インスタンス変数でなくて良い
    room.destroy
    redirect_to root_path
  end
  private
  def room_params
    params.require(:room).permit(:name,user_ids:[])
    #user_idsというキーに対応する配列の保存許可
  end
end
