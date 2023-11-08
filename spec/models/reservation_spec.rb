require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      reservation = build(:reservation)
      expect(reservation).to be_valid
    end

    it 'is not valid without an expert_id' do
      reservation = build(:reservation, expert_id: nil)
      expect(reservation).to_not be_valid
    end

    it 'is not valid without a user_id' do
      reservation = build(:reservation, user_id: nil)
      expect(reservation).to_not be_valid
    end

    it 'is not valid without a date' do
      reservation = build(:reservation, date: nil)
      expect(reservation).to_not be_valid
    end

    it 'is not valid without a city' do
      reservation = build(:reservation, city: nil)
      expect(reservation).to_not be_valid
    end
  end

  describe 'associations' do
    it 'belongs to an expert' do
      association = described_class.reflect_on_association(:expert)
      expect(association.macro).to eq :belongs_to
    end

    it 'belongs to a user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
  end
end
