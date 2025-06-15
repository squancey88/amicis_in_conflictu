FactoryBot.define do
  factory :character do
    given_name { "MyString" }
    family_name { "MyString" }
    physical_description { "" }
    world
    born_during { create(:time_period) }
    character_type
    character_species_type
    visibility { 0 }

    factory :player_character do
      controlled_by { create(:user) }
    end
  end
end
