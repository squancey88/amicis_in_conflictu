FactoryBot.define do
  factory :game_map do
    map_type { "hex_diamond" }
    name { Faker::Lorem.word }
    owner { create(:user) }
    config { {} }
  end
end
