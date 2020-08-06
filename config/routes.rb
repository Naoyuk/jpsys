Rails.application.routes.draw do
  get 'welcome/index'

  resources :items
  resources :customers
  resources :orders
  resources :lists
  resources :purchases
  resources :suppliers

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
