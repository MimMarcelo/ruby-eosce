class Schedule < ApplicationRecord
    validates :name, length: {maximum:40}
    has_many :schedule_stations
    has_many :station_templates, through: :schedule_stations

    has_many :user_schedules
    has_many :users, through: :user_schedules

    def total_time
        @time = 0

        self.station_templates.each do |station|
            @time += station.minutes
        end
        return @time
    end
end
