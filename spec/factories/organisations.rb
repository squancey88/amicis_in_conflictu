FactoryBot.define do
  factory :organisation do
    name { Faker::Lorem.word }
    world
    organisation_type
  end
end
