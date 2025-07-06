FactoryBot.define do
  factory :api_key do
    created_by { create(:user) }
    expires_in_days { 1 }
  end
end
