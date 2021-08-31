class Schedule < ApplicationRecord
    has_many :schedule_stations
    has_many :station_templates, through: :schedule_stations

    has_many :users
    has_many :users, through: :users
end
