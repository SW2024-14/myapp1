Rails.application.routes.draw do
  root 'users#index'
  
  # カート関連のルート
  get '/cart', to: 'carts#show', as: 'cart'
  post '/cart/add_item', to: 'carts#add_item', as: 'add_item_cart'
  post '/cart/purchase', to: 'carts#purchase', as: 'purchase_cart'
  delete '/cart_items/:id', to: 'carts#remove_from_cart', as: 'remove_from_cart'
  
  # ユーザー関連のルート
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users, only: [:index, :new, :create, :destroy]
  
  # セッション関連のルート
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  
  # レストラン関連のルート
  resources :restaurants
end
