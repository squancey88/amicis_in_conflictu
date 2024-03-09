FactoryBot.define do
  factory :user do
    email { "test@squancey.co.uk" }
    password { "password" }
    gaming_groups { [] }
  end
end
