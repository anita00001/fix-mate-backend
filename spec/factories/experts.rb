FactoryBot.define do
  factory :expert do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    address { Faker::Address.full_address }
    specialization { create(:specialization) }
    experience { Faker::Number.between(from: 1, to: 20) }
    fee { Faker::Number.decimal(l_digits: 2) }
  end
end
