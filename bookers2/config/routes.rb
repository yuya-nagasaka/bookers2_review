Rails.application.routes.draw do
  devise_for :views
  devise_for :users
  root to: "home#top"
  get "home/about"=>"abouts#about",as:"about"
  resources:books  do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update] do
  	resource :relationships, only: [:create, :destroy]
  	get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'
  end
end
