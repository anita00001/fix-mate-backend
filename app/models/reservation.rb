class Reservation < ApplicationRecord
  belongs_to :expert
  belongs_to :user

  validates :expert_id, presence: true
  validates :user_id, presence: true
  validates :date, presence: true
  validates :city, presence: true
end
