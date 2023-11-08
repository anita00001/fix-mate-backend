require 'rails_helper'

RSpec.describe Specialization, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      specialization = build(:specialization)
      expect(specialization).to be_valid
    end

    it 'is not valid without a name' do
      specialization = build(:specialization, name: nil)
      expect(specialization).to_not be_valid
    end

    it 'is not valid without a description' do
      specialization = build(:specialization, description: nil)
      expect(specialization).to_not be_valid
    end
  end

  describe 'associations' do
    it 'has one expert' do
      association = described_class.reflect_on_association(:expert)
      expect(association.macro).to eq :has_one
    end
  end
end
