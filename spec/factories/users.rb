FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "password" }
    gaming_groups { [] }
  end
end
