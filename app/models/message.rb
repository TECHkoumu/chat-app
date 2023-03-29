class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image #マイグレーションにカラム追加の必要なし
  validates:content, presence:true
end
