class ExamApplyStation < ApplicationRecord
    belongs_to :exam_apply
    belongs_to :station_apply
    # validates_uniqueness_of :
  end