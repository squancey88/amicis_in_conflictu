FactoryBot.define do
  factory :unit do
    name { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    cost { 1 }
    stat_modifiers { [] }
    army_list
  end
end
