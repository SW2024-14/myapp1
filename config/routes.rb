Rails.application.routes.draw do
  root 'users#index'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users
end
