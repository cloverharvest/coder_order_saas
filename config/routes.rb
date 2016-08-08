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

  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "logout"

  resources :contacts

#   Prefix Verb   URI Pattern                  Controller#Action
#        root GET    /                            pages#home
#       about GET    /about(.:format)             pages#about
# new_contact GET    /contacts/new(.:format)      contacts#new
#     sign_up GET    /sign_up(.:format)           users#new
#             POST   /sign_up(.:format)           users#create
#        user GET    /users/:id(.:format)         users#show
#   edit_user GET    /users/:id/edit(.:format)    users#edit
#             PATCH  /users/:id(.:format)         users#update
#       login GET    /login(.:format)             sessions#new
#             POST   /login(.:format)             sessions#create
#      logout DELETE /logout(.:format)            sessions#destroy
#    contacts GET    /contacts(.:format)          contacts#index
#             POST   /contacts(.:format)          contacts#create
#             GET    /contacts/new(.:format)      contacts#new
# edit_contact GET    /contacts/:id/edit(.:format) contacts#edit
#     contact GET    /contacts/:id(.:format)      contacts#show
#             PATCH  /contacts/:id(.:format)      contacts#update
#             PUT    /contacts/:id(.:format)      contacts#update
#             DELETE /contacts/:id(.:format)      contacts#destroy
end
