Rails.application.routes.draw do
  root :to => "pages#home"
  get "/about", to: "pages#about", as: "about"

  # get "/users", to: "users#index", as: "users"
  get "/sign_up", to: "users#new", as: "sign_up"
  post "/sign_up", to: "users#create", as: "users"
  get "/users/:id", to: "users#show", as: "user"

  resources :contacts





# Prefix Verb   URI Pattern                  Controller#Action
#    users_new GET    /users/new(.:format)         users#new
#        users GET    /users(.:format)             users#index
#              POST   /users(.:format)             users#create
#     new_user GET    /users/new(.:format)         users#new
#    edit_user GET    /users/:id/edit(.:format)    users#edit
#         user GET    /users/:id(.:format)         users#show
#              PATCH  /users/:id(.:format)         users#update
#              PUT    /users/:id(.:format)         users#update
#              DELETE /users/:id(.:format)         users#destroy
#     contacts GET    /contacts(.:format)          contacts#index
#              POST   /contacts(.:format)          contacts#create
#  new_contact GET    /contacts/new(.:format)      contacts#new
# edit_contact GET    /contacts/:id/edit(.:format) contacts#edit
#      contact GET    /contacts/:id(.:format)      contacts#show
#              PATCH  /contacts/:id(.:format)      contacts#update
#              PUT    /contacts/:id(.:format)      contacts#update
#              DELETE /contacts/:id(.:format)      contacts#destroy
#        about GET    /about(.:format)             pages#about
#         root GET    /                            pages#home

end
