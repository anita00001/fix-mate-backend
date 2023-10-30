class Specialization < ApplicationRecord
  has_one :expert

  validates :name, presence: true
  validates :description, presence: true
end
