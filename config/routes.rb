Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"
  get '/signup', to: 'users#new'
  # resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy] or 
  resources :articles
  resources :users, except: [:new]
end
