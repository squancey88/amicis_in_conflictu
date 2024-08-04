require "rails_helper"

RSpec.describe "GameSystems::Wargames", type: :request do
  let(:user) { create(:user) }
  let(:wargame) { create(:wargame) }
  let(:game_config) {
    {
      scoring_name: "Test"
    }
  }

  let(:valid_attributes) {
    {
      name: "Test Wargame",
      slug: "test-wargame",
      game_config_json_string: game_config.to_json.to_s
    }
  }

  let(:invalid_attributes) {
    {
      name: nil,
      slug: nil
    }
  }

  before do
    sign_in(user)
  end

  describe "GET /show" do
    it "renders a successful response" do
      get game_systems_wargame_url(wargame)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_game_systems_wargame_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      get edit_game_systems_wargame_url(wargame)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new GameSystems::Wargame" do
        expect {
          post game_systems_wargames_url, params: {game_systems_wargame: valid_attributes}
        }.to change(GameSystems::Wargame, :count).by(1)
      end

      it "sets the config" do
        post game_systems_wargames_url, params: {game_systems_wargame: valid_attributes}
        expect(GameSystems::Wargame.last.game_config).to eq(game_config.with_indifferent_access)
      end

      it "redirects to the created wargame" do
        post game_systems_wargames_url, params: {game_systems_wargame: valid_attributes}
        expect(response).to redirect_to(GameSystems::Wargame.last)
      end
    end

    context "with invalid parameters" do
      it "does not create a new GameSystems::Wargame" do
        expect {
          post game_systems_wargames_url, params: {game_systems_wargame: invalid_attributes}
        }.to change(GameSystems::Wargame, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post game_systems_wargames_url, params: {game_systems_wargame: invalid_attributes}
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

      it "updates the requested wargame" do
        patch game_systems_wargame_url(wargame), params: {game_systems_wargame: new_attributes}
        wargame.reload
        expect(wargame.name).to eq("New name")
      end

      it "redirects to the wargame" do
        patch game_systems_wargame_url(wargame), params: {game_systems_wargame: new_attributes}
        wargame.reload
        expect(response).to redirect_to(game_systems_wargame_url(wargame))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        patch game_systems_wargame_url(wargame), params: {game_systems_wargame: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested game" do
      wargame
      expect {
        delete game_systems_wargame_url(wargame)
      }.to change(GameSystems::Wargame, :count).by(-1)
    end

    it "redirects to the games list" do
      delete game_systems_wargame_url(wargame)
      expect(response).to redirect_to(game_systems_url)
    end
  end
end
