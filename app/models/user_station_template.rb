class UserStationTemplate < ApplicationRecord
    belongs_to :user
    belongs_to :station_template
end
