FactoryBot.define do
  factory :character_species_type do
    name { Faker::Lorem.word }
    world
  end
end
