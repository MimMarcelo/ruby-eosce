Rails.application.routes.draw do
  resources :station_templates
  # route for the homepage
  root 'home#index'

  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
