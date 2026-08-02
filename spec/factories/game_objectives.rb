FactoryBot.define do
  factory :game_objective do
    sequence(:name) { |n| "#{Faker::Lorem.word} Objective #{n}" }
    description { "" }
    scoring_key { "primary" }

    game_system { create(:wargame) }
  end
end
