FactoryBot.define do
  factory :game_system do
    name { "Test Game System" }
    game_config {}
    edition { "1st" }
    competitive { true }
    slug { Faker::Internet.slug }
  end
end
