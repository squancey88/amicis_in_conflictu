FactoryBot.define do
  factory :mapping_layer, class: 'Mapping::Layer' do
    name { "MyString" }
    map { nil }
  end
end
