Rails.application.routes.draw do
  get 'public/index/:c', controller: 'public', action: 'index'
  get 'public/add_to_basket/:id/:qty', controller: 'public', action: 'add_to_basket'
  get 'public/remove_from_basket/:id', controller: 'public', action: 'remove_from_basket'
  post 'public/send_order'
  post 'authentication/login'
  get 'authentication/logout'
  get 'admin/index'
  get 'admin/private'
  get 'public/ajax_update_cart'
  get 'cart', to:"public#cart"
  resources :products
  resources :categories

  root 'public#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
