require "rails_helper"

RSpec.describe "Players", type: :request do
  let(:game) { create(:game) }
  let(:user) { create(:user) }
  let(:player) { create(:player, controller: user, game:) }

  before do
    sign_in(user)
  end
  describe "PATCH /update" do
    context "with valid parameters" do
      let(:valid_attributes) {
        {
          notes: {}.to_json
        }
      }
      it "should update player" do
        patch player_url(player), params: {
          player: valid_attributes
        }
        expect(response).to redirect_to(game)
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) {
        {
          notes: {}
        }
      }
      it "should update player" do
        patch player_url(player), params: {player: invalid_attributes}
        expect(response).to have_http_status(400)
      end
    end
  end
end
