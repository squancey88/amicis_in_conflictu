require "rails_helper"

RSpec.describe GameSystems::Wargame, type: :model do
  let(:game_system) { create(:wargame, name: "Test") }

  context "attributes" do
    it { expect(game_system).to have_attributes(name: "Test") }
  end

  context "schema generation" do
    before do
      @schema = GameSystems::Wargame.schema
    end

    it "should have scoring systems" do
      expect(@schema[:properties][:scoring_system][:enum]).to eq([:turn_based, :non_scoring])
    end
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

  context "turn based game" do
    let(:wargame) { create(:wargame, :turn_based) }
    let(:game) { create(:game, player_count: 2, game_system: wargame) }
    let(:player1) { game.players.first }
    let(:player2) { game.players.last }

    context "with winning scores" do
      before do
        player1.turns = [
          {primary: 5, secondary: 3},
          {primary: 3, secondary: 0}
        ]
        player1.save!
        player1.reload

        player2.turns = [
          {primary: 10, secondary: 5},
          {primary: 3, secondary: 8}
        ]
        player2.save!
        player2.reload
      end

      it "should correctly assign winner when finished" do
        game.finish_reason = "Game End"
        game.game_state = :finished
        game.save!
        player1.reload
        player2.reload
        expect(player1.lost?).to be true
        expect(player2.won?).to be true
      end
    end

    context "with drawing scores" do
      before do
        player1.turns = [
          {primary: 2, secondary: 6},
          {primary: 1, secondary: 2}
        ]
        player1.save!
        player1.reload

        player2.turns = [
          {primary: 5, secondary: 3},
          {primary: 3, secondary: 0}
        ]
        player2.save!
        player2.reload
      end

      it "should correctly assign winner when finished" do
        game.finish_reason = "Game End"
        game.game_state = :finished
        game.save!
        player1.reload
        player2.reload
        expect(player1.draw?).to be true
        expect(player2.draw?).to be true
      end
    end

    context "with drawing scores but a surrendered player" do
      before do
        player1.turns = [
          {primary: 2, secondary: 6},
          {primary: 1, secondary: 2}
        ]
        player1.surrendered = true
        player1.save!
        player1.reload

        player2.turns = [
          {primary: 5, secondary: 3},
          {primary: 3, secondary: 0}
        ]
        player2.save!
        player2.reload
      end

      it "should correctly assign winner when finished" do
        game.finish_reason = "Player Surrender"
        game.game_state = :finished
        game.save!
        player1.reload
        player2.reload
        expect(player1.lost?).to be true
        expect(player2.won?).to be true
      end
    end
  end
end
