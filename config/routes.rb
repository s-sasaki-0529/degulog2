Rails.application.routes.draw do

  root :to => 'home#index'
  get 'home/index'

  namespace :api, defaults: { format: :json } do
    resources :degus, only: [:index, :show, :create, :update, :destroy]
    resources :weights, only: [:index, :create, :update, :destroy]
  end
end
