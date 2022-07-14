class StationTemplateQuestion < ApplicationRecord
  belongs_to :question
  belongs_to :station_template
  validates_uniqueness_of :station_template_id, :scope => :question_id
end
