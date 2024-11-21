require "rails_helper"

RSpec.describe Game, type: :model do
  let(:game_system) { create(:game_system) }
  let(:gaming_session) { create(:gaming_session) }

  describe "associations" do
    it { should belong_to(:gaming_session) }
    it { should belong_to(:game_system) }
    it { should have_many(:players) }
  end

  describe "validations" do
    it { should validate_presence_of(:players) }

    it "should require a gaming_system" do
      game = Game.new(gaming_session:)
      expect(game.valid?).to be false
    end

    it "should require a gaming_session" do
      game = Game.new(game_system:)
      expect(game.valid?).to be false
    end
  end

  context "state" do
    context "finished" do
      let(:finished_game) { create(:game, game_state: :finished, game_system:) }

      it "finished? should be true" do
        expect(finished_game.finished?).to be true
      end
    end

    context "not_played" do
      let(:not_played_game) { create(:game, game_state: :not_played) }

      it "finished? should be false" do
        expect(not_played_game.finished?).to be false
      end
    end
  end
end
