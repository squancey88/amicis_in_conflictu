require "rails_helper"

RSpec.describe Player, type: :model do
  let(:user) { create(:user) }
  let(:game) { create(:game) }

  it "requires controller" do
    player = Player.new(game:)
    expect(player.save).to be false
  end

  it "requires game" do
    player = Player.new(controller: user)
    expect(player.save).to be false
  end

  context "with turn based data" do
    let(:wargame) { create(:wargame, :turn_based) }
    let(:game) { create(:game, game_system: wargame) }
    let(:player) { game.players.first }

    context "with scores" do
      before do
        player.turns = [
          {primary: 10, secondary: 5},
          {primary: 3, secondary: 8}
        ]
        player.save!
        player.reload
      end

      it "should have the correct amount of turns" do
        expect(player.turns.length).to be(2)
      end

      it "should calculate score correctly" do
        expect(player.calculate_score).to eq(10 + 5 + 3 + 8)
      end
    end
  end
end
