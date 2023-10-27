class Expert < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true 
  validates :specialization_id, presence: true
  validates :experience, presence: true
  validates :image, presence: true
  validates :fee, presence: true

  has_many :reservations
  belongs_to :specialization
end
