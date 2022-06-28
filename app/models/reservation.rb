class Reservation < ApplicationRecord
  belongs_to :schedule
  belongs_to :sheet
  validates :name, presence: true
  validates :email, presence: true, length: { maximum: 255 },
  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :date, presence: true, uniqueness: {scope: :sheet_id}
  validates :schedule_id, presence: true
  validates :sheet_id, presence: true
end