require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'is not valid without an email' do
      user = build(:user, email: nil)
      expect(user).to_not be_valid
    end

    it 'is not valid without a password' do
      user = build(:user, password: nil)
      expect(user).to_not be_valid
    end

    it 'is not valid with a duplicate email' do
      create(:user, email: 'user@example.com')
      user = build(:user, email: 'user@example.com')
      expect(user).to_not be_valid
    end

    it 'is valid with a unique email' do
      create(:user, email: 'user@example.com')
      user = build(:user, email: 'another_user@example.com')
      expect(user).to be_valid
    end

    it 'is not valid with a password that is too short' do
      user = build(:user, password: 'short')
      expect(user).to_not be_valid
    end
  end

  describe 'Devise modules' do
    it 'is recoverable' do
      expect(User.new).to respond_to(:send_reset_password_instructions)
    end

    it 'is rememberable' do
      expect(User.new).to respond_to(:remember_me)
    end

    it 'is jwt-authenticatable' do
      expect(User.new).to respond_to(:jwt_payload)
    end
  end

  describe 'associations' do
    it 'has many reservations' do
      user = create(:user)
      reservation = create(:reservation, user:)

      expect(user.reservations).to include(reservation)
    end
  end
end
