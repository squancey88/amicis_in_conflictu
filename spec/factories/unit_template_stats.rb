FactoryBot.define do
  factory :unit_template_stat do
    unit_template
    unit_stat_definition
    base_value { 1 }
  end
end
