FactoryBot.define do
  factory :turn_objective do
    game_objective { nil }
    player { nil }
    turn { 1 }
    points_scored { 1 }
  end
end
