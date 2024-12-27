FactoryBot.define do
  factory :time_period do
    order { 1 }
    world
    name { "MyString" }
    description { {} }
  end
end
