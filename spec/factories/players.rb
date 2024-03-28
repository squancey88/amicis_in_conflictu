FactoryBot.define do
  factory :player do
    user { nil }
    game { nil }
    winner { false }
  end
end
