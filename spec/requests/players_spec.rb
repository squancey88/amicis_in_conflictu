require "rails_helper"

RSpec.describe "Players", type: :request do
  let(:game_system) { create(:wargame) }
  let(:game) { create(:game) }
  let(:user) { create(:user) }
  let(:army) { create(:army, game_system:) }
  let(:army_list) { create(:army_list, army:, game_system:) }
  let(:player) { create(:player, controller: user, game:) }

  before do
    sign_in(user)
  end
  describe "PATCH /update" do
    context "with valid parameters" do
      let(:valid_attributes) {
        {
          notes: {}.to_json,
          player_armies_attributes: [
            army_id: army.id
          ]
        }
      }
      it "should update player" do
        patch player_url(player), params: {
          player: valid_attributes
        }
        expect(response).to redirect_to(game)
        player.reload
        expect(player.player_armies[0].army).to eq(army)
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) {
        {
          notes: {}
        }
      }
      it "should not update player" do
        patch player_url(player), params: {player: invalid_attributes}
        expect(response).to have_http_status(400)
      end
    end
  end
end
