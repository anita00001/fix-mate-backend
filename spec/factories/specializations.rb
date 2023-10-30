FactoryBot.define do
  factory :specialization do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
  end
end
