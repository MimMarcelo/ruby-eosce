Rails.application.routes.draw do
  resources :station_applies
  resources :exam_applies
  scope "(:locale)" do

    resources :exams
    get 'exams/new/:schedule_id', to: 'exams#new', as: 'create_exam'

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
    #resources :station_templates do
    #  resources :questions
    #end
    get 'station_templates/new/:schedule_id', to: 'station_templates#new', as: 'create_station'

    get 'station_template_questions/:station_id', to: 'station_template_questions#index', as: 'station_template_questions'
    post 'station_template/:station_id/add_question/:question_id', to: 'station_template_questions#create', as: 'add_question_to_station_template'
    delete 'station_template/:station_id/remove_question/:question_id', to: 'station_template_questions#destroy', as: "remove_question_from_station_template"

    # route for the homepage
    root 'home#index'

    get 'home/index'

    post 'station/:station_id/question/:question_id', to: 'choices#foo', as: 'new_foo'


    devise_for :users
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  end
end
