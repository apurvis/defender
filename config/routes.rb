Rails.application.routes.draw do
#  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :cases
  resources :charges
  resources :phone_numbers
  resources :witnesses

  # People classes
  resources :attorneys
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
