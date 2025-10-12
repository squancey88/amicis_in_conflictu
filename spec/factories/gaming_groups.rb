FactoryBot.define do
  factory :gaming_group do
    name { Faker::Lorem.word }

    transient do
      members { [] }
      owners { [] }
    end

    after(:create) do |gaming_group, context|
      context.members.each do |member|
        create(:user_group_membership, gaming_group:, user: member, owner: false)
      end
      context.owners.each do |owner|
        create(:user_group_membership, gaming_group:, user: owner, owner: true)
      end
    end
  end
end
