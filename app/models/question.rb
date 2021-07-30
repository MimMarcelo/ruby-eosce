class Question < ApplicationRecord
  has_many :choices
  has_many :station_template_questions
  has_many :station_templates, through: :station_template_questions
end
