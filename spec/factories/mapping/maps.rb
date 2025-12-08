FactoryBot.define do
  factory :mapping_map, class: 'Mapping::Map' do
    name { "MyString" }
    world { nil }
  end
end
