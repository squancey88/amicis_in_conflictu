require "rails_helper"

RSpec.describe "/api/game_systems/unit_stat_modifiers", type: :request do
  let!(:user) { create(:user) }
  let!(:wargame) { create(:wargame) }
  let!(:unit_stat_modifiers) { create_list(:unit_stat_modifier, 2, game_system: wargame) }

  describe "without auth" do
    describe "show" do
      it "should be unauthorized" do
        get api_game_systems_path
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe "with jwt login" do
    describe "index" do
      let(:json_data) { JSON.parse(response.body) }
      before do
        get_with_token(user, api_game_system_unit_stat_modifiers_path(wargame))
      end

      it "should be authorized" do
        expect(response).to have_http_status(:successful)
      end

      it "returns array of records" do
        expect(json_data["records"]).to be_an(Array)
      end

      it "returns correct number of records" do
        expect(json_data["records"].count).to eq 2
      end

      it "returns pagination" do
        expect(json_data["pagination"]["count"]).to eq(2)
      end
    end
  end
end
