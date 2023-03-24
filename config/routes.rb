Rails.application.routes.draw do
  devise_for :installs
  get 'messages/index'
  root to:"messages#index" #ルートパスへのアクセス時、messages_controllerのindexアクション呼び出す
end
