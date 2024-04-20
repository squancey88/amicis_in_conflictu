FactoryBot.define do
  factory :wargame, class: "GameSystems::Wargame" do
    name { "Test Wargame System" }
    game_config {
      {}
    }
    edition { "1st" }
    competitive { true }
    slug { Faker::Internet.slug }

    trait :turn_based do
      game_config {
        {
          scoring_system: :turn_based,
          scoring_name: "VP",
          finish_reasons: [
            "Game End",
            "Army Wipe",
            "Player Surrender"
          ],
          turn_data: [
            {
              key: :primary,
              name: "Primary",
              type: :number,
              scoring: true
            },
            {
              key: :secondary,
              name: "Secondary",
              type: :number,
              scoring: true
            }
          ]
        }
      }
    end
  end
end
