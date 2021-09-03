class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :user_schedules
  has_many :schedules, through: :user_schedules

  has_many :user_station_templates
  has_many :station_templates, through: :user_station_templates
end
