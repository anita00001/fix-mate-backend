class Specialization < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :icon, presence: true

  has_one :expert
end
