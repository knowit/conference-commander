Rails.application.routes.draw do
  get '/events/:event_id/allergies', to: 'allergies#index', as: :event_allergies

  resources :events do
    resources :event_sessions
    resources :accommodations
    resources :hotels do
      resources :images, shallow: true
    end
    resources :participations do
      collection do
        get :single_room_participants
      end
    end
    resources :activities do
      resources :images, shallow: true
    end
    resources :tracks
  end

  resources :participations

  resources :after_signup

  resources :users do
    resources :event_sessions
  end

  resources :event_sessions, only: [:index]

  # we need to redirect in order to use the correct method and thus the correct layout:
  get '/pages/front', to: redirect('/')
  get '/pages/:page' => 'pages#show'

  get '/signin' => 'sessions#new', :as => :signin
  delete '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/failure' => 'sessions#failure'

  root to: 'pages#front'
end
