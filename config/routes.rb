Betastore::Application.routes.draw do

  root :to => 'products#index'
  resources :subscriptions

  get '/products' => 'products#index', as: 'products'
  get '/products/:id' => 'products#show', as: 'product'

  post '/products/:product_id/add_to_cart' => 'carts#update', as: 'add_to_cart'
  get '/cart' => 'carts#show', as: 'cart'

  put '/order' => 'orders#update', as: 'order'

  namespace :admin do
    resources :products
  end

end
