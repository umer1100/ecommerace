Rails.application.routes.draw do
  resources :products
  resources :comments
  root 'products#index'
  devise_for :users
  resources :order_items
  get 'cart', to: 'carts#show'
  
  resources :products do
    resources :comments
  end
  #delete 'logout'  => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
