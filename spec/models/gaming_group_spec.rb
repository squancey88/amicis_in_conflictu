require "rails_helper"

RSpec.describe GamingGroup, type: :model do
  let(:gaming_group) { create(:gaming_group, name: "Test") }

  let(:owner) {
    user = create(:user)
    create(:user_group_membership, user:, gaming_group:, owner: true)
    user
  }

  let(:member) {
    user = create(:user)
    create(:user_group_membership, user:, gaming_group:, owner: false)
    user
  }

  context "attributes" do
    it { expect(gaming_group).to have_attributes(name: "Test") }
  end

  it "should return members correctly" do
    expect(gaming_group.members).to eq([member])
  end

  it "should return owners correctly" do
    expect(gaming_group.owners).to eq([owner])
  end

  it "should correctly return for is_owner?" do
    expect(gaming_group.is_owner?(owner)).to be true
    expect(gaming_group.is_owner?(member)).to be false
  end
end
