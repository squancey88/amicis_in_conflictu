require "rails_helper"

RSpec.describe "/api/gaming_groups/:id/gaming_sessions", type: :request do
  let(:user) { create(:user) }
  let(:gaming_group) { create(:gaming_group, owners: [user]) }
  let!(:gaming_session) { create(:gaming_session, gaming_group:) }
  let(:valid_attributes) {
    {
      start_time: DateTime.now
    }
  }

  let(:invalid_attributes) {
    {
      start_time: nil
    }
  }

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
        expect(json_body).to be_an(Array)
      end

      it "returns correct number of records" do
        expect(json_body.count).to eq 1
      end
    end

    describe "show" do
      before do
        get_with_token(user, api_gaming_group_gaming_session_path(gaming_group, gaming_session))
      end

      it "should be authorized" do
        expect(response).to have_http_status(:successful)
      end

      it "returns data" do
        expect(json_body).to be_an(Hash)
        expect(json_body["id"]).to eq(gaming_session.id)
      end
    end

    describe "create" do
      it "creates valid record with valid data" do
        expect {
          post_with_token(user, api_gaming_group_gaming_sessions_path(gaming_group), params: {gaming_session: valid_attributes})
        }.to change(GamingSession, :count).by(1)
      end

      it "does not create record with invalid data" do
        expect {
          post_with_token(user, api_gaming_group_gaming_sessions_path(gaming_group), params: {gaming_session: invalid_attributes})
        }.not_to change(GamingSession, :count)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
