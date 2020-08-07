Rails.application.routes.draw do

  devise_for :users
  root 'home#top'
  get 'home/about' => 'home#about'



  resources :users,only: [:show,:index,:edit,:update]
  # 投稿されたBookに結びつくいいね、コメントのルーティングを設定
  resources :books,only: [:index,:show,:create,:update,:edit,:destroy] do
    resource :favorites, only: [:create, :destroy]
  end

end
