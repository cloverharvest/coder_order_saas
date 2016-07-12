Rails.application.routes.draw do
  get 'sessions/new'

  root :to => "pages#home"
  get "/about", to: "pages#about", as: "about"

  # get "/users", to: "users#index", as: "users"
  get "/sign_up", to: "users#new", as: "sign_up"
  post "/sign_up", to: "users#create", as: "users"
  get "/users/:id", to: "users#show", as: "user"

  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "logout"

  resources :contacts

  # Prefix Verb   URI Pattern                  Controller#Action
  # sessions_new GET    /sessions/new(.:format)      sessions#new
  #         root GET    /                            pages#home
  #        about GET    /about(.:format)             pages#about
  #      sign_up GET    /sign_up(.:format)           users#new
  #        users POST   /sign_up(.:format)           users#create
  #         user GET    /users/:id(.:format)         users#show
  #        login GET    /login(.:format)             sessions#new
  #     sessions GET    /sessions(.:format)          sessions#index
  #              POST   /sessions(.:format)          sessions#create
  #  new_session GET    /sessions/new(.:format)      sessions#new
  # edit_session GET    /sessions/:id/edit(.:format) sessions#edit
  #      session GET    /sessions/:id(.:format)      sessions#show
  #              PATCH  /sessions/:id(.:format)      sessions#update
  #              PUT    /sessions/:id(.:format)      sessions#update
  #              DELETE /sessions/:id(.:format)      sessions#destroy
  #     contacts GET    /contacts(.:format)          contacts#index
  #              POST   /contacts(.:format)          contacts#create
  #  new_contact GET    /contacts/new(.:format)      contacts#new
  # edit_contact GET    /contacts/:id/edit(.:format) contacts#edit
  #      contact GET    /contacts/:id(.:format)      contacts#show
  #              PATCH  /contacts/:id(.:format)      contacts#update
  #              PUT    /contacts/:id(.:format)      contacts#update
  #              DELETE /contacts/:id(.:format)      contacts#destroy

end
