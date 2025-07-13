FactoryBot.define do
  sequence(:character_species_name) { |n| "Species #{n}" }

  factory :character_species_type do
    name { generate(:character_species_name) }
    world
  end
end
