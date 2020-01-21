Rails.application.routes.draw do
  namespace :api do
   namespace :v1 do
    devise_for :users do
      resources :carts
    end
    resources :products do
      resources :product_tags
      resources :cart_products
    end
    resources :categories
    resources :tags
   end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
