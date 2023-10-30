FactoryBot.define do
  factory :reservation do
    expert
    user
    date { Faker::Time.forward(days: 30, period: :day) }
    city { Faker::Address.city }
  end
end
