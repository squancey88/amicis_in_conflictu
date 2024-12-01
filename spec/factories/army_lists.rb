FactoryBot.define do
  factory :army_list do
    name { "My Army List" }
    details { {} }
    starting_cost { nil }
    army
    user
    game_system { create(:wargame, :turn_based) }
  end
end
