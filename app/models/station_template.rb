class StationTemplate < ApplicationRecord
  validates :name, length: {maximum:40}
  
  has_many :station_template_questions, dependent: :destroy
  has_many :questions, through: :station_template_questions
  
  has_many :schedule_stations
  has_many :schedules, through: :schedule_stations
  
  has_many :user_station_templates
  has_many :users, through: :user_station_templates
end
