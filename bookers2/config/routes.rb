Rails.application.routes.draw do
  devise_for :users
  root to: "home#top"
  get "home/about"=>"abouts#about",as:"about"
end
