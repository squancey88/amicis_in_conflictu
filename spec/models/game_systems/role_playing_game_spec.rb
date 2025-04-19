require "rails_helper"

RSpec.describe GameSystems::RolePlayingGame, type: :model do
  let(:game_system) { create(:role_playing_game, name: "Test") }

  context "attributes" do
    it { expect(game_system).to have_attributes(name: "Test") }
  end
end
