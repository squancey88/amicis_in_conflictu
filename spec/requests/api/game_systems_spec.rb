require "rails_helper"

RSpec.describe "/api/games", type: :request do
  let!(:user) { create(:user) }
  let!(:wargame) { create(:wargame) }
  let!(:card_game) { create(:card_game) }

  describe "without auth" do
    describe "show" do
      it "should be unauthorized" do
        get api_game_systems_path
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe "with jwt login" do
    describe "show" do
      before do
        get_with_token(user, api_game_systems_path)
      end

      it "should be authorized" do
        expect(response).to have_http_status(:successful)
      end

      it "returns array" do
        expect(JSON.parse(response.body)).to be_an(Array)
      end

      it "returns correct number of records" do
        expect(JSON.parse(response.body).count).to eq 2
      end
    end
  end
end
