FactoryBot.define do
  factory :campaign do
    name { Faker::Lorem.word }
    gaming_group { gaming_group }
    game_system { create(:game_system) }
  end
end
