FactoryBot.define do
  factory :unit_stat_change do
    unit_stat_definition
    unit_stat_modifier
    stat_change { 1 }
  end
end
