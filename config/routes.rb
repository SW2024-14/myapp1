Rails.application.routes.draw do
  root 'users#index'
  
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