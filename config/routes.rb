Rails.application.routes.draw do
  get 'public/index'
  get 'shop/:c', controller: 'public', action: 'shop'
  get 'public/add_to_basket/:id/:qty', controller: 'public', action: 'add_to_basket'
  get 'public/remove_from_basket/:id', controller: 'public', action: 'remove_from_basket'
  post 'public/send_order'
  post 'authentication/login'
  get 'authentication/logout'
  get 'admin/index'
  get 'admin/private'
  get 'admin/orders'
  get 'public/ajax_update_cart'
  get 'cart', to:"public#cart"
  post '/', controller: 'public', action: 'index'
  get 'products/view', controller:'products', action:'index'
  get 'products/visibility/:id', to: "products#update_visibility"

  post 'products/upload', controller:'products', action:'upload'
  resources :products
  resources :categories
  resources :slider_images

  post 'categories/set_order', controller: 'categories', action: 'set_order'

  root 'public#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
