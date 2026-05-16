require "rails_helper"

RSpec.describe GameMap, type: :model do
  context "associations" do
    it { should belong_to(:owner) }
  end

  context "validations" do
    it "requires map_type" do
      game_map = GameMap.new
      expect(game_map.valid?).to be false
      expect(game_map.errors).to include("map_type")
    end
  end
end
