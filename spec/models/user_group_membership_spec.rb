require "rails_helper"

RSpec.describe UserGroupMembership, type: :model do
  let(:user_group_membership) { create(:user_group_membership, owner: true) }

  context "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:gaming_group) }
  end

  context "attributes" do
    it { expect(user_group_membership).to have_attributes(owner: true) }
  end
end
