FactoryBot.define do
  factory :article do
    title { "MyString" }
    world { create(:world) }
    visibility { 0 }

    after(:create) do |article|
      create_list(:text_section, 2, relates_to: article)
    end
  end
end
