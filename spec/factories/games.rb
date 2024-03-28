FactoryBot.define do
  factory :game do
    gaming_group { create(:gaming_group) }
    game_system { create(:game_system) }
  end
end
