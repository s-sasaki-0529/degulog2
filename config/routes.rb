Rails.application.routes.draw do

  root :to => 'home#index'
  get 'home' => 'home#index'

  get 'weights' => 'weights#index'

  get 'boughts' => 'boughts#index'

  get 'tweets' => 'tweets#index'

  get 'degus' => 'degus#index'

  # API
  namespace :api, defaults: { format: :json } do
    resources :degus, only: [:index, :show, :create, :update, :destroy]
    resources :weights, only: [:index, :create, :update, :destroy]
  end
end
