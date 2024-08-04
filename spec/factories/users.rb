FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "password" }
    gaming_groups { [] }

    trait :admin do
      admin { true }
    end
  end
end
