FactoryBot.define do
  factory :location do
    name { Faker::Lorem.word }
    description { "" }
    history { "" }
    located_in { nil }
    world
    location_type
  end
end
