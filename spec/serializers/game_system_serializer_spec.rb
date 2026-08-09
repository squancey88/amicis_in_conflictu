require "rails_helper"

RSpec.describe GameSystemSerializer do
  let(:result) { described_class.new(game_system).as_json }

  context "Wargame" do
    let(:game_system) { create(:wargame) }

    it "serializes attributes" do
      expect(result["id"]).to eq(game_system.id)
      expect(result["name"]).to eq(game_system.name)
      expect(result["scoring_keys"]).to eq(game_system.scoring_keys)
    end
  end

  context "Card Game" do
    let(:game_system) { create(:card_game) }

    it "serializes attributes" do
      expect(result["id"]).to eq(game_system.id)
      expect(result["name"]).to eq(game_system.name)
    end

    it "does not have scoring_keys" do
      expect(result).not_to have_key("scoring_keys")
    end
  end
end
