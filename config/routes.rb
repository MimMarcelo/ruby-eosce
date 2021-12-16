Rails.application.routes.draw do
  scope "(:locale)" do
    resources :answers
    resources :choices

    resources :questions do
      resources :choices
    end

    resources :schedules do
      resources :schedule_stations
    end
    get 'schedules/:id/add/:station_template_id', to: 'schedules#add_station', as: 'add_station'
    get 'schedules/:id/remove/:station_template_id', to: 'schedules#remove_station', as: 'remove_station'


    resources :station_templates
    resources :station_templates do
      resources :questions
    end
    get 'station_templates/new/:schedule_id', to: 'station_templates#new', as: 'create_station'

    # route for the homepage
    root 'home#index'

    get 'home/index'

    post 'station/:station_id/question/:question_id', to: 'choices#foo', as: 'new_foo'


    devise_for :users
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  end
end
