Rails.application.routes.draw do
  resources :events
  resources :users do
    resources :proposals, controller: :user_proposals
  end

  # we need to redirect in order to use the correct method and thus the correct layout:
  get '/pages/front', to: redirect('/')
  get '/pages/:page' => 'pages#show'

  root to: 'pages#front'
end
