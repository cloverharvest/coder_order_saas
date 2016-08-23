  Rails.application.routes.draw do

  root :to => "pages#home"
  get "/about", to: "pages#about", as: "about"
  get "/contacts/new", to: "contacts#new", as: "new_contact"

  get "/users", to: "users#index", as: "users"
  post "/users", to: "users#create"
  get "/sign_up", to: "users#new", as: "sign_up"

  get "/users/:id/edit", to: "users#edit", as: "edit_user"
  get "/users/:id", to: "users#show", as: "user"
  patch "/users/:id", to: "users#update"
  delete "users/:id", to: "users#destroy"

  resources :account_activations, only: [:edit]

  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "logout"

  resources :contacts

  end
