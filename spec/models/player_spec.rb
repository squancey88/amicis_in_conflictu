require "rails_helper"

RSpec.describe Player, type: :model do
  let(:user) { create(:user) }
  let(:team_users) { create_list(:user, 3) }
  let(:team) { create(:team, users: team_users) }
  let(:game) { create(:game) }

  context "associations" do
    it { should belong_to(:game) }
    it { should belong_to(:controller) }
    it { should have_many(:player_armies) }
    it { should have_many(:armies) }
  end

  context "validations" do
    it "requires controller" do
      player = Player.new(game:)
      expect(player.valid?).to be false
    end

    it "requires game" do
      player = Player.new(controller: user)
      expect(player.valid?).to be false
    end
  end

  describe "user_is_player?" do
    it "should return true if user in team" do
      player = Player.new(controller: team, game:)
      expect(player.user_is_player?(team_users.first)).to be true
      expect(player.user_is_player?(user)).to be false
    end

    it "should return true if user is player" do
      player = Player.new(controller: user, game:)
      expect(player.user_is_player?(team_users.first)).to be false
      expect(player.user_is_player?(user)).to be true
    end
  end

  context "with turn based data" do
    let(:wargame) { create(:wargame, :turn_based) }
    let(:game) { create(:game, game_system: wargame) }
    let(:player) { game.players.first }

    context "with scores" do
      before do
        player.turns = [
          {primary: 10, secondary: 5},
          {primary: 3, secondary: 6}
        ]
        player.save!
        player.reload
      end

      it "should have the correct amount of turns" do
        expect(player.turns.length).to be(2)
      end

      it "should calculate score correctly" do
        expect(player.calculate_score).to eq(10 + 5 + 3 + 6)
      end

      it "should return keys correctly" do
        score_hash = player.score_by_keys
        expect(score_hash[:primary]).to eq(10 + 3)
        expect(score_hash[:secondary]).to eq(5 + 6)
      end
    end
  end
end
