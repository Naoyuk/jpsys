# frozen_string_literal: true

Rails.application.routes.draw do
  get '/welcome/index'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :items
  resources :customers
  resources :orders
  resources :lists
  resources :purchases
  resources :suppliers
  resources :users

  root 'welcome#index'
end
