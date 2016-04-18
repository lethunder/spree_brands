Spree::Core::Engine.routes.append do
  namespace :admin do
    resources :brands
  end
end