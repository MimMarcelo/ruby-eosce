class StationTemplateQuestion < ApplicationRecord
  belongs_to :question
  belongs_to :station_template
end
