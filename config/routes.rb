Rails.application.routes.draw do

  devise_for :users
  root 'home#top'
  get 'home/about' => 'home#about'

  post 'follow/:id' => 'relationships#follow', as: 'follow'
  # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  # フォロー外す

  resources :users,only: [:show,:index,:edit,:update] do
    get 'users/followers' => 'users#followers'
    get 'users/followeds' => 'users#followeds'
  end
  # 投稿されたBookに結びつくいいね、コメントのルーティングを設定
  resources :books,only: [:index,:show,:create,:update,:edit,:destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

end
