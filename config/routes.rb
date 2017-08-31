Rails.application.routes.draw do

  get '/' => 'home#index'

  # API
  namespace :api, defaults: { format: :json } do
    resources :degus, only: [:index, :show, :create, :update, :destroy]
    resources :measurements, only: [:index, :create, :update, :destroy] do
      resources :weights, only: [:index, :create, :update, :destroy]
    end
    resources :boughts, only: [:index]
    resources :tweets, only: [:index]
  end
end
