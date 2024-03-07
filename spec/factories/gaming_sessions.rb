FactoryBot.define do
  factory :gaming_session do
    start_time { "2024-03-07 20:43:47" }
    gaming_group { create(:gaming_group) }
  end
end
