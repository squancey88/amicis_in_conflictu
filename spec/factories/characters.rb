FactoryBot.define do
  factory :character do
    given_name { Faker::Name.first_name }
    family_name { Faker::Name.last_name }
    physical_description { {} }
    history { {} }
    config { {} }
    world
    born_during { create(:time_period, world:) }
    character_type { create(:character_type, world:) }
    character_species_type { create(:character_species_type, world:) }
    visibility { 0 }
    world_owner_notes { {} }

    factory :player_character do
      controlled_by { create(:user) }
    end
  end
end
