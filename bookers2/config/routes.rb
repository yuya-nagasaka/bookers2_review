Rails.application.routes.draw do
  devise_for :views
  devise_for :users
  root to: "home#top"
  get "home/about"=>"abouts#about",as:"about"
  resources:books  do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources:users
end
