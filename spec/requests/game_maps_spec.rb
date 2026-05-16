require "rails_helper"

RSpec.describe "/game_maps", type: :request do
  let(:user) { create(:user) }
  let!(:game_map) { create(:game_map) }
  let(:valid_attributes) {
    {
      name: "Test",
      map_type: :hex_diamond,
      config: {
        min: 1, max: 4
      }
    }
  }

  let(:invalid_attributes) {
    {
      name: "Test",
      map_type: nil
    }
  }

  before do
    sign_in(user)
  end

  describe "GET /index" do
    it "renders a successful response" do
      get game_maps_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get game_map_url(game_map)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_game_map_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      get edit_game_map_url(game_map)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new GameMap" do
        expect {
          post game_maps_url, params: {game_map: valid_attributes}
        }.to change(GameMap, :count).by(1)
      end

      it "redirects to the created game_map" do
        post game_maps_url, params: {game_map: valid_attributes}
        expect(response).to redirect_to(game_map_url(GameMap.order(:created_at).last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new GameMap" do
        expect {
          post game_maps_url, params: {game_map: invalid_attributes}
        }.to change(GameMap, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post game_maps_url, params: {game_map: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          name: "New name"
        }
      }

      it "updates the requested game_map" do
        patch game_map_url(game_map), params: {game_map: new_attributes}
        game_map.reload
        expect(game_map.name).to eq("New name")
      end

      it "redirects to the game_map" do
        patch game_map_url(game_map), params: {game_map: new_attributes}
        game_map.reload
        expect(response).to redirect_to(game_map_url(game_map))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        patch game_map_url(game_map), params: {game_map: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested game_map" do
      expect {
        delete game_map_url(game_map)
      }.to change(GameMap, :count).by(-1)
    end

    it "redirects to the game_maps list" do
      delete game_map_url(game_map)
      expect(response).to redirect_to(game_maps_url)
    end
  end
end
