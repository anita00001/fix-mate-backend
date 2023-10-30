FactoryBot.define do
  factory :specialization do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    icon { 'specialization_icon.png' }
  end
end
