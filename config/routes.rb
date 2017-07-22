Rails.application.routes.draw do

  get '/' => 'home#index'

  # API
  namespace :api, defaults: { format: :json } do
    resources :degus, only: [:index, :show, :create, :update, :destroy]
    resources :measurements, only: [:index, :create, :update, :destroy]
    resources :boughts, only: [:index]
  end
end
