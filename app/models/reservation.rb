class Reservation < ApplicationRecord
  belongs_to :expert
  belongs_to :user
end
