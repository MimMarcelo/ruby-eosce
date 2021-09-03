class StationTemplate < ApplicationRecord
    has_many :schedule_stations
    has_many :schedules, through: :schedule_stations

    has_many :user_station_templates
    has_many :users, through: :user_station_templates
end
