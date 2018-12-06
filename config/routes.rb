Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#home'
  namespace :api do 
    resources :products
  end 
  resources :adoptions, only: [:new, :create, :destroy] 
  resources :users
  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  delete '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
end
