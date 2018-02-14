Rails.application.routes.draw do

  get '/' => 'home#index'

  # API
  namespace :api, defaults: { format: :json } do
    resources :degus, only: %i[index show]
    resources :measurements, only: %i[index create]
    resources :boughts, only: %i[index]
    resources :tweets, only: %i[index]
  end
end
