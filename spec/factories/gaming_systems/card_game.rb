FactoryBot.define do
  factory :card_game, class: "GameSystems::CardGame" do
    name { "Test Card Game System" }
    game_config {
      {}
    }
    edition { "1st" }
    competitive { true }
    slug { Faker::Internet.slug }

    trait :has_health do
      game_config {
        {
          has_health: true
        }
      }
    end
  end
end
