FactoryBot.define do
  factory :rpg, class: "GameSystems::RolePlayingGame" do
    name { "Test RPG System" }
    game_config { {} }
    edition { "1st" }
    competitive { false }
    slug { Faker::Internet.slug }
  end
end
