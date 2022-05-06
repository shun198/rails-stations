class Movie < ApplicationRecord
  has_many :schedules, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :year, presence: true
  validates :description, presence: true
end
