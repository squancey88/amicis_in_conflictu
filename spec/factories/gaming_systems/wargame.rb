FactoryBot.define do
  factory :wargame, class: "GameSystems::Wargame" do
    name { "Test Wargame System" }
    game_config { {} }
    edition { "1st" }
    competitive { true }
    slug { Faker::Internet.slug }
  end
end
