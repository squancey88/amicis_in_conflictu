FactoryBot.define do
  factory :campaign do
    name { Faker::Lorem.word }
    gaming_group { create(:gaming_group) }
    game_system { create(:wargame, :turn_based) }
    list_start_cost { nil }
  end
end
