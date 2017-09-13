FactoryGirl.define do
  factory :group_event do
    name { Faker::Name.name }
    description  { Faker::Lorem.paragraph }
    location { Faker::Address.street_address }
    starts_at Date.today
    ends_at Date.today + 2.days
    published false
  end

  trait :incomplete do
    starts_at nil
  end
end
