class StationTemplate < ApplicationRecord
  has_many :station_template_questions, dependent: :destroy
  has_many :questions, through: :station_template_questions
end
