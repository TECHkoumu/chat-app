Rails.application.routes.draw do

  devise_for :users
  get 'messages/index'
  root to:"rooms#index" #ルートパスへのアクセス時、rooms_controllerのindexアクション呼び出す
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create, :destroy] do #destroy追加
    resources :messages, only:[:index, :create]
  end
end
