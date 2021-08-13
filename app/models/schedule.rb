class Schedule < ApplicationRecord
    has_many :schedule_stations
    has_many :station_templates, through: :schedule_stations
end
