FactoryBot.define do
  factory :game_objective do
    name { Faker::Lorem.word }
    description { "" }
    scoring_key { "primary" }

    game_system { create(:wargame) }
  end
end
