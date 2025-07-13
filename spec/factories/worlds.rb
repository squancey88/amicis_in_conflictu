FactoryBot.define do
  sequence(:world_name) { |n| "World #{n}" }

  factory :world do
    name { generate(:world_name) }
    blurb { {} }
    time_period_config { {} }
    owner { create(:user) }
  end
end
