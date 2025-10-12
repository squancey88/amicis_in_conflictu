require "rails_helper"

RSpec.describe "/api/games", type: :request do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:gaming_group) { create(:gaming_group, owners: [user]) }
  let(:gaming_session) { create(:gaming_session, gaming_group:) }
  let(:game) { create(:game, gaming_session:) }

  describe "without auth" do
    describe "show" do
      it "should be unauthorized" do
        get api_game_path(game)
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe "as different user" do
    describe "show" do
      before do
        get_with_token(other_user, api_game_path(game))
      end

      it "should be forbidden" do
        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  describe "with jwt login" do
    describe "show" do
      before do
        get_with_token(user, api_game_path(game))
      end

      it "should be authorized" do
        expect(response).to have_http_status(:successful)
      end

      it "returns hash" do
        expect(JSON.parse(response.body)).to be_an(Hash)
      end
    end
  end
end
