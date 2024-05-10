require "rails_helper"

RSpec.describe Army, type: :model do
  let(:user) { create(:user) }
  let(:game_system) { create(:game_system, has_army_lists: true) }
  context "attributes" do
    it "should require user" do
      army = Army.new(game_system:, name: "test")
      expect(army.save).to be false
    end

    it "should require game_system" do
      army = Army.new(user:, name: "test")
      expect(army.save).to be false
    end
  end

  it "should return true if game system can have lists" do
    army = create(:army, game_system:)
    expect(army.can_have_lists?).to be true
  end
end
