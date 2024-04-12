require "rails_helper"

RSpec.describe GameSystems::Wargame, type: :model do
  let(:game_system) { create(:wargame, name: "Test") }

  context "attributes" do
    it { expect(game_system).to have_attributes(name: "Test") }
  end

  context "setup game data" do
    describe "with turns" do
      let(:game_system) {
        create(:wargame, game_config: {
          scoring_system: :turn_based
        })
      }

      it "should return true for has_turns" do
        expect(game_system.has_turns?).to be true
      end
    end
  end
end
