class ExamApply < ApplicationRecord
  belongs_to :exam
  has_many :station_applies
  # has_many :exam_apply_stations
  # has_many :station_applies, through: :exam_apply_stations
end
