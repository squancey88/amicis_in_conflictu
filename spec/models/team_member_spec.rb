require "rails_helper"

RSpec.describe TeamMember, type: :model do
  let(:user) { create(:user) }
  let(:team) { create(:team) }

  it "should require team" do
    member = TeamMember.new(user:)
    expect(member.save).to be false
  end

  it "should require user" do
    member = TeamMember.new(team:)
    expect(member.save).to be false
  end
end
