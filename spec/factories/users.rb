FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "password" }
    password_migration { "password" }
    gaming_groups { [] }

    trait :admin do
      admin { true }
    end

    trait :invite_pending do
      password { SecureRandom.hex(20) }
      invitation_token { SecureRandom.hex(20) }
      invitation_created_at { DateTime.now }
      invited_by { create(:user) }
    end

    trait :forgot_password do
      reset_password_token { SecureRandom.hex(20) }
      reset_password_sent_at { DateTime.now }
    end
  end
end
