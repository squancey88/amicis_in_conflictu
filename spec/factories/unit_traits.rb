FactoryBot.define do
  factory :unit_trait do
    name { "MyString" }
    description { "MyString" }
    game_system
    army { nil }
    active { true }
  end
end
