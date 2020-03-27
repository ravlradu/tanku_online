Rails.application.routes.draw do
  get 'public/index'
  get 'public/add_to_basket/:id/:qty', controller: 'public', action: 'add_to_basket'
  get 'public/send_order'
  post 'authentication/login'
  get 'authentication/logout'
  get 'admin/index'
  get 'admin/private'
  resources :products
  resources :categories

  root 'public#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
