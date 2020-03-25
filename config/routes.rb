Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  get 'about' => 'home#about'

  resources :hobby_images, only: [:new, :create, :index, :show, :destroy] do
  	resource :favorites, only: [:create, :destroy]
  	resource :hobby_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update]

  get 'category' => 'categories#index', as: "categories"
end