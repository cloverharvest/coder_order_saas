Rails.application.routes.draw do

  # get "/", to: "welcome#index", as: 'root'

  root :to => "welcome#index"
end
