Rails.application.routes.draw do
  root 'home#index'

  resources :users, only: [:new, :create]
  resources :lists do
    resources :tasks
  end

  namespace :api do
    namespace :v1 do
      resources :tasks, only: [:update]
    end
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
end
