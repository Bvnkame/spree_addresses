Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :api do
  	resources :addresses, only: [:show, :update, :create]
  	resources :time_deliveries
  end
end
