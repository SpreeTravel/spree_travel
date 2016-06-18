Spree::Core::Engine.routes.draw do
  # Add your extension routes here

  patch 'line_items/update/:id' => 'line_items#update', :as => 'line_items_update'

  resources :paxes

  namespace :admin do
    resources :product_types
    resources :products do
      resources :rates
      member do
        post :delete_rates
      end
    end
  end

end
