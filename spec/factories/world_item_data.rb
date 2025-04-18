FactoryBot.define do
  factory :world_item_datum do
    category { "MyString" }
    visibility { 0 }
    relates_to { nil }
    data { "" }
    order { 1 }
  end
end
