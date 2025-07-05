FactoryBot.define do
  factory :location do
    name { "MyString" }
    description { "" }
    history { "" }
    located_in { nil }
    world { nil }
    location_type { nil }
  end
end
