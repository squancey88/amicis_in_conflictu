require "rails_helper"

RSpec.describe TeamMember, type: :model do
  let(:user) { create(:user) }
  let(:team) { create(:team) }

  context "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:team) }
  end

  context "validations" do
    it "should require team" do
      member = TeamMember.new(user:)
      expect(member.valid?).to be false
    end

    it "should require user" do
      member = TeamMember.new(team:)
      expect(member.valid?).to be false
    end
  end
end
