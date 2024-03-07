FactoryBot.define do
  factory :user_group_membership do
    user { create(:user) }
    gaming_group { create(:gaming_group) }
  end
end
