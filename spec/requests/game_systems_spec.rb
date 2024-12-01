require "rails_helper"

RSpec.describe "/game_systems", type: :request do
  let!(:wargame) { create(:wargame) }

  before do
    sign_in create(:user)
  end

  describe "GET /index" do
    it "renders a successful response" do
      get game_systems_url
      expect(response).to be_successful
    end
  end
end
