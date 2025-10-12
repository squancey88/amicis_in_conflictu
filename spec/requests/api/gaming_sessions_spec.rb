require "rails_helper"

RSpec.describe "/api/gaming_groups/:id/gaming_sessions", type: :request do
  let(:user) { create(:user) }
  let(:gaming_group) { create(:gaming_group, owners: [user]) }
  let!(:gaming_session) { create(:gaming_session, gaming_group:) }

  describe "without auth" do
    describe "index" do
      it "should be unauthorized" do
        get api_gaming_groups_path
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe "with jwt login" do
    describe "index" do
      before do
        get_with_token(user, api_gaming_group_gaming_sessions_path(gaming_group))
      end

      it "should be authorized" do
        expect(response).to have_http_status(:successful)
      end

      it "returns array" do
        expect(JSON.parse(response.body)).to be_an(Array)
      end

      it "returns correct number of records" do
        expect(JSON.parse(response.body).count).to eq 1
      end
    end
  end
end
