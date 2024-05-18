require "rails_helper"

RSpec.describe GamesHelper, type: :helper do
  describe "players_html" do
    let(:game) { create(:game) }

    it "should include the correct class" do
      expect(helper.players_html(game)).to have_css(".badge", count: 2)
    end

    describe "with winner" do
      before do
        player = game.players.first
        player.result = :won
        player.save!
        game.reload
      end

      it "should include the correct class" do
        expect(helper.players_html(game)).to have_css(".text-bg-success", count: 1)
      end
    end
  end
end
