require 'rails_helper'

RSpec.describe Expert, type: :model do
  it 'is valid with valid attributes' do
    expert = build(:expert)
    expect(expert).to be_valid
  end

  it 'is not valid without a first name' do
    expert = build(:expert, first_name: nil)
    expect(expert).to_not be_valid
  end

  it 'is not valid without a last name' do
    expert = build(:expert, last_name: nil)
    expect(expert).to_not be_valid
  end

  it 'is not valid without an address' do
    expert = build(:expert, address: nil)
    expect(expert).to_not be_valid
  end

  it 'is not valid without a specialization_id' do
    expert = build(:expert, specialization_id: nil)
    expect(expert).to_not be_valid
  end

  it 'is not valid without experience' do
    expert = build(:expert, experience: nil)
    expect(expert).to_not be_valid
  end

  it 'is not valid without a fee' do
    expert = build(:expert, fee: nil)
    expect(expert).to_not be_valid
  end

  it 'has many reservations' do
    expert = create(:expert)
    reservation = create(:reservation, expert:)
    expect(expert.reservations).to include(reservation)
  end

  it 'belongs to a specialization' do
    specialization = create(:specialization)
    expert = create(:expert, specialization:)
    expect(expert.specialization).to eq(specialization)
  end
end
