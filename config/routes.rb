Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "application#index"

  resources :users
  resources :games
  resources :reviews
  resources :sessions

  resources :users do
    resources :games
  end
 
  get '/sessions', to: 'sessions#new'
  get '/logout/:id', to: 'sessions#destroy'
  delete '/logout/:id', to: 'sessions#destroy', as: 'logout'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/most_user', to: "users#most_users", as: 'most_users'
end
