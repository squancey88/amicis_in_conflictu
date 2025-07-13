FactoryBot.define do
  sequence(:character_types_name) { |n| "Character type #{n}" }

  factory :character_type do
    name { generate(:character_types_name) }
    config { nil }
    world
  end
end
