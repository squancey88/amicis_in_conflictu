require "rails_helper"

RSpec.describe Team, type: :model do
  it "should require a name" do
    team = Team.new(name: nil)
    expect(team.save).to be false
  end
end
