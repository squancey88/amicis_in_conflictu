FactoryBot.define do
  factory :quest do
    title { "MyString" }
    blurb { "" }
    world { create(:world) }
    created_by { create(:user) }
  end
end
