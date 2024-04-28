require "rails_helper"

RSpec.describe PlayerArmy, type: :model do
  let(:player) { create(:player, :with_game, :with_user) }
  let(:army) { create(:army) }
  context "attributes" do
    it "should require player" do
      player_army = PlayerArmy.new(army:)
      expect(player_army.save).to be false
    end

    it "should require army" do
      player_army = PlayerArmy.new(player:)
      expect(player_army.save).to be false
    end
  end
end
