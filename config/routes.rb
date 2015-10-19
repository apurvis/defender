Rails.application.routes.draw do
#  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users

  resources :users
  resources :cases
  resources :defendant_charges
  resources :charges
  resources :offices
  resources :phone_numbers
  resources :witnesses

  # People classes
  resources :defense_attorneys
  resources :prosecuting_attorneys
  resources :complainants
  resources :defendants
  resources :judges
  resources :people
  resources :people_cases
  resources :people_events

  # Event classes
  resources :events
  resources :court_appearances
  resources :investigations
  resources :arrests
end
