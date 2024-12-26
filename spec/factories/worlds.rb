FactoryBot.define do
  factory :world do
    name { Faker::Lorem.word }
    blurb { {} }
    time_period_config { {} }
    owner { create(:user) }
  end
end
