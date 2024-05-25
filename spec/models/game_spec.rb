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
      let(:finished_game) { create(:game, game_state: :finished) }

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
  end
end
