Rails.application.routes.draw do
  # ユーザー登録
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  # ログイン
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # ユーザー情報編集
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  patch '/users/:id', to: 'users#update'
  root "users#new"

  resources :users  # Defines routes for users controller
end