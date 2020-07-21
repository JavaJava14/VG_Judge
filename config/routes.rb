Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "application#index"

  resources :users
  resources :games
  resources :reviews
  resources :sessions, only: [:new]

  resources :users do
    resources :games
  end
 
  get '/sessions', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout/:id', to: 'sessions#destroy'
  delete '/logout/:id', to: 'sessions#destroy', as: 'logout'
  get '/auth/:provider/callback', to: 'sessions#omniauth'
  get '/most_user', to: "users#most_users", as: 'most_users'
end
