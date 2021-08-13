class ScheduleStation < ApplicationRecord
  belongs_to :schedule
  belongs_to :station_template
end
