Rails.application.routes.draw do

  get 'pages/index'

  # root :to => "welcome#index"

  root :to => "pages#index"
end
