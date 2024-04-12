FactoryBot.define do
  factory :player do
    winner { false }

    trait :with_team do
      association :controller, factory: :team
    end

    trait :with_user do
      association :controller, factory: :user
    end

    trait :with_game do
      game
    end
  end
end
