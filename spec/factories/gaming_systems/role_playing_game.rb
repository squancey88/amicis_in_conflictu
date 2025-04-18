FactoryBot.define do
  factory :role_playing_game, class: "GameSystems::RolePlayingGame" do
    name { "Test RPG System" }
    game_config { {} }
    edition { "1st" }
    competitive { false }
    slug { Faker::Internet.slug }
  end
end
