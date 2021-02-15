# frozen_string_literal: true

Rails.application.routes.draw do
  get 'welcome/index'
  get 'signup', to:'users#new'

  resources :items
  resources :customers
  resources :orders
  resources :lists
  resources :purchases
  resources :suppliers
  resources :users

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
