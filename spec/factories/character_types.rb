FactoryBot.define do
  factory :character_type do
    name { Faker::Lorem.word }
    config { nil }
    world
  end
end
