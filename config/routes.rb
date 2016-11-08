Rails.application.routes.draw do
  resources :users
  get '/pages/:page' => 'pages#show'
  root to: 'pages#index'
end
