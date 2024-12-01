FactoryBot.define do
  factory :unit_stat do
    unit
    unit_stat_definition
    base_value { 1 }
  end
end
