FactoryBot.define do
  factory :article do
    title { "MyString" }
    world { create(:world) }
    visibility { 0 }

    transient do
      text_section_count { 2 }
    end

    after(:create) do |article, context|
      create_list(:text_section, context.text_section_count, relates_to: article)
    end
  end
end
