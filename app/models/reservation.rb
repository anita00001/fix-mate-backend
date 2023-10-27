class Reservation < ApplicationRecord
  validates :expert_id, presence: true
  validates :user_id, presence: true
  validates :city, presence: true
  validates :date, presence: true
end
