Rails.application.routes.draw do
  resources :events
  resources :users

  # we need to redirect in order to use the correct method and thus the correct layout:
  get '/pages/front', to: redirect('/')
  get '/pages/:page' => 'pages#show'

  get '/signin' => 'sessions#new', :as => :signin
  delete '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/failure' => 'sessions#failure'

  root to: 'pages#front'  
end
