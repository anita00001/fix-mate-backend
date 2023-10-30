FactoryBot.define do
  factory :reservation do
    expert { create(:expert) }
    user { create(:user) }
    date { Faker::Time.forward(days: 30, period: :day) }
    city { Faker::Address.city }
  end
end
