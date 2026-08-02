require "rails_helper"

RSpec.describe "Api::GameObjectives", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/game_objectives/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/api/game_objectives/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/api/game_objectives/update"
      expect(response).to have_http_status(:success)
    end
  end
end
