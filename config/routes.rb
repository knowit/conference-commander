Rails.application.routes.draw do
  get '/events/:event_id/allergies', to: 'allergies#index', as: :event_allergies

  resources :events do
    resources :proposals, controller: :event_proposals
    resources :participations
  end

  resources :users do
    resources :proposals, controller: :user_proposals
  end

  resources :proposals, only: [:index]

  resources :accommodations

  # we need to redirect in order to use the correct method and thus the correct layout:
  get '/pages/front', to: redirect('/')
  get '/pages/:page' => 'pages#show'

  get '/signin' => 'sessions#new', :as => :signin
  delete '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/failure' => 'sessions#failure'

  root to: 'pages#front'
end
