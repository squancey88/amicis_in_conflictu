require "rails_helper"

RSpec.describe Game, type: :model do
  let(:game_system) { create(:game_system) }
  let(:gaming_session) { create(:gaming_session) }

  it "should require a gaming_system" do
    game = Game.new(gaming_session:)
    expect(game.save).to be false
  end

  it "should require a gaming_session" do
    game = Game.new(game_system:)
    expect(game.save).to be false
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

    context "with scores" do
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
        game.finish(finish_reason: "army_wipe")
        player1.reload
        player2.reload
        expect(player1.winner).to be false
        expect(player2.winner).to be true
      end
    end
  end
end
