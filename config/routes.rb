Rails.application.routes.draw do
  resources :answers
  resources :choices

  resources :questions do
    resources :choices
  end

  resources :schedules do
    resources :schedule_stations
  end
  get 'schedules/:id/add/:station_template_id', to: 'schedules#add_stations'

  resources :station_templates
  # route for the homepage
  root 'home#index'

  get 'home/index'


  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
