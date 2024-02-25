require "rails_helper"

RSpec.describe "GameSystems", type: :request do
  describe "GET /game_systems" do
    it "works! (now write some real specs)" do
      get game_systems_path
      expect(response).to have_http_status(200)
    end
  end
end
