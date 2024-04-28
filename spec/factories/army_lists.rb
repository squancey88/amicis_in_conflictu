FactoryBot.define do
  factory :army_list do
    name { "My Army List" }
    details { {} }
    army
    cost { 1 }
  end
end
