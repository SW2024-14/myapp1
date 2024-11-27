Rails.application.routes.draw do
  root 'restaurants#index'  # または別のルートパス

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  
  # 他のルーティング
end