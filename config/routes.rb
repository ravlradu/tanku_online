Rails.application.routes.draw do
  post 'authentication/login'
  get 'authentication/logout'
  get 'admin/index'
  get 'admin/private'
  get 'home', to:"home#index"
  resources :products
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
