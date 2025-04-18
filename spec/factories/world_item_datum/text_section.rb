FactoryBot.define do
  factory :text_section, class: "WorldItemData::TextSection" do
    data {
      {
        title: "Test"
      }
    }
    relates_to { create(:article) }
  end
end
