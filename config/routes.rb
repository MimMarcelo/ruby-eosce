Rails.application.routes.draw do
  resources :answers
  resources :choices

  resources :questions do
    resources :choices
  end

  resources :schedules
  resources :station_templates
  resources :station_templates do
    resources :questions
  end

  # route for the homepage
  root 'home#index'

  get 'home/index'



  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
