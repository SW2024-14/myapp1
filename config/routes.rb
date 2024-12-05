
Rails.application.routes.draw do
  root 'users#index'
  
  # カート関連のルート
  get '/cart', to: 'carts#show', as: 'cart'
  post '/cart/add_item', to: 'carts#add_item', as: 'add_item_cart'
  
  # 既存のルート
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users, only: [:index, :new, :create, :destroy]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :restaurants
  delete '/cart_items/:id', to: 'carts#remove_from_cart', as: 'remove_from_cart'
end