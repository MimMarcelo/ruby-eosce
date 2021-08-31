class StationTemplate < ApplicationRecord
    has_many :schedule_stations
    has_many :schedule, through: :schedule_stations

    has_many :schedule_stations
    has_many :users, through: :schedule_stations
end
