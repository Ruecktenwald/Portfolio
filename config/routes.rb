Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :posts
    resources :admin_users

    root to: "users#index"
  end

  get '/search' => 'posts#search', :as => 'search_page'
	get "posts/category/:category" => 'posts#index', as: 'category_posts'
  resources :posts
  devise_for :users

  root to: 'static#homepage'

end
