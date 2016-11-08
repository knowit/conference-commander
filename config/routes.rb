Rails.application.routes.draw do
  resources :users

  # we need to redirect in order to use the correct method and thus the correct layout:
  get '/pages/front', to: redirect('/')
  get '/pages/:page' => 'pages#show'

  root to: 'pages#front'
  root to: 'pages#index'

  get '/signin' => 'sessions#new', :as => :signin
  delete '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/failure' => 'sessions#failure'
  
end
