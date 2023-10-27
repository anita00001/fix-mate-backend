class Specialization < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :icon, presence: true
end
