class Schedule < ApplicationRecord
    validates :name, length: {maximum:40}
    has_many :schedule_stations
    has_many :station_templates, through: :schedule_stations

    has_many :user_schedules
    has_many :users, through: :user_schedules
end
