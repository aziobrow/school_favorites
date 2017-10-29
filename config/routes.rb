Rails.application.routes.draw do
  root "welcome#index"

  post '/login', to: "sessions#create"
  get '/auth/google_oauth2/callback', to: 'sessions#create'
  get '/login', to: "sessions#new"
  delete '/logout', to: "sessions#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]  do
  end

  resources :schools, only: [:index, :show] do
    resources :favorite_schools, only: [:create, :destroy]
  end

  resources :districts, only: [:index, :show]

  resources :favorite_schools, only: [] do
    resources :notes, only: [:create]
  end

  namespace :admin do
    resources :schools, only: [:new, :create, :edit, :update, :destroy]
    resources :districts, only: [:edit, :update]
    resources :users, only: [:index, :destroy]
  end
end
