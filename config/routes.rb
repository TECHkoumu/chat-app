Rails.application.routes.draw do

  devise_for :users
  get 'messages/index'
  root to:"messages#index" #ルートパスへのアクセス時、messages_controllerのindexアクション呼び出す
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create]
end
