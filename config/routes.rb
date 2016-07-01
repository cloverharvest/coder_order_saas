Rails.application.routes.draw do

  root :to => "pages#home"

  get "/about", to: "pages#about", as: "about"

  resources :contacts

#         root GET    /                            pages#home
#        about GET    /about(.:format)             pages#about
#     contacts GET    /contacts(.:format)          contacts#index
#              POST   /contacts(.:format)          contacts#create
#  new_contact GET    /contacts/new(.:format)      contacts#new
# edit_contact GET    /contacts/:id/edit(.:format) contacts#edit
#      contact GET    /contacts/:id(.:format)      contacts#show
#              PATCH  /contacts/:id(.:format)      contacts#update
#              PUT    /contacts/:id(.:format)      contacts#update
#              DELETE /contacts/:id(.:format)      contacts#destroy

end
