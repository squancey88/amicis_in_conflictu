require "rails_helper"

RSpec.describe "/api/gaming_groups", type: :request do
  let(:user) { create(:user) }
  let!(:gaming_group_as_owner) { create(:gaming_group, owners: [user]) }
  let!(:gaming_group_as_user) { create(:gaming_group, members: [user]) }

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
        get_with_token(user, api_gaming_groups_path)
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
