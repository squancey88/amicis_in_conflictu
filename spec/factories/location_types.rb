FactoryBot.define do
  factory :location_type do
    name { Faker::Lorem.word }
    world
  end
end
