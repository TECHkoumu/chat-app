class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image #マイグレーションにカラム追加の必要なし
  validates:content, presence:true, unless: :was_attached?
  #返り値がfalseの時、was_attached?メソッド呼び出し

  def was_attached?
    self.image.attached?
    #画像があればtrueを返す
  end
end
