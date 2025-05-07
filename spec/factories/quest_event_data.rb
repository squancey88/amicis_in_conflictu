FactoryBot.define do
  factory :quest_event_datum do
    quest_event { create(:quest_event) }
    order { 1 }
    data { {} }
  end
end
