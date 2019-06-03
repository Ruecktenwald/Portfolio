Rails.application.routes.draw do

  namespace :admin do
    resources :admin_users
    resources :users
    resources :categories
    resources :posts
    root to: "users#index"
  end

  devise_for :users, :controllers => { registrations: 'registrations' }
  get 'users/profile/:name' => 'users#show', as: 'users_profile'
  root to: 'static#homepage'

  get 'search' => 'posts#search', :as => 'search_page'
  get 'categories/:top-four' => 'categories#top_four', as: 'top-four'
  get 'recent-posts/:recent' => 'posts#recent', :as => 'most_recent'
  
  resources :categories do
    resources :posts, only: [:new, :create]
  end  
  
  resources :posts, only: [:show, :edit, :update, :destroy]
end
