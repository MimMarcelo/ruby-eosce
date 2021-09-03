class ScheduleStation < ApplicationRecord
  belongs_to :schedule
  belongs_to :station_template
  # validates_uniqueness_of :
end
