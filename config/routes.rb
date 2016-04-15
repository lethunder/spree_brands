Spree::Core::Engine.routes.append do
  namespace :admin do
    resources :brands
    # resources :users do
      # resources :store_credits
    # end
  end
end