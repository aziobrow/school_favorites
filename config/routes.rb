Rails.application.routes.draw do
  root "welcome#index"

  post '/login', to: "sessions#create"
  get '/login', to: "sessions#new"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]

  resources :schools, only: [:index, :show]

  resources :districts, only: [:index, :show]

  namespace :admin do
    resources :schools, only: [:new, :create]
  end
end
