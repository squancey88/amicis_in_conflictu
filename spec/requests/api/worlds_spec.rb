require "rails_helper"

RSpec.describe "/api/worlds", type: :request do
  let(:owner) { create(:user) }
  let!(:api_key) { create(:api_key, created_by: owner, expires_in_days: 2) }
  let!(:world) { create(:world, owner:) }

  describe "without api key" do
    describe "index" do
      it "should be unauthorized" do
        get api_worlds_path
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe "with api key" do
    describe "index" do
      it "should be authorized" do
        get api_worlds_path, headers: {
          "Authorization" => "Bearer #{api_key.key}"
        }
        expect(response).to have_http_status(:successful)
      end
    end

    describe "which has expried" do
      it "should be unauthorized" do
        travel_to 8.days.from_now do
          get api_worlds_path, headers: {
            "Authorization" => "Bearer #{api_key.key}"
          }
          expect(response).to have_http_status(:unauthorized)
        end
      end
    end
  end
end
