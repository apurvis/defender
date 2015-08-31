Rails.application.routes.draw do
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users

  resources :attorneys
  resources :cases
  resources :charges
  resources :defendants
  resources :phone_numbers
end
