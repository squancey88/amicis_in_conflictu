require "rails_helper"

RSpec.describe Army, type: :model do
  let(:game_system) { create(:game_system, has_army_lists: true) }

  context "associations" do
    it { should belong_to(:game_system) }
    it { should have_many(:army_lists) }
  end

  context "validations" do
    it "should require game_system" do
      army = Army.new(name: "test")
      expect(army.valid?).to be false
    end
  end
end
