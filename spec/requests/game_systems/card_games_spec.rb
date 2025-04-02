require "rails_helper"

RSpec.describe "GameSystems::CardGames", type: :request do
  let(:user) { create(:user, :admin) }
  let(:card_game) { create(:card_game) }
  let(:game_config) {
    {
      scoring_name: "Test"
    }
  }

  let(:valid_attributes) {
    {
      name: "Test CardGame",
      slug: "test-card_game",
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
      get game_systems_card_game_url(card_game)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_game_systems_card_game_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      get edit_game_systems_card_game_url(card_game)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new GameSystems::CardGame" do
        expect {
          post game_systems_card_games_url, params: {game_systems_card_game: valid_attributes}
        }.to change(GameSystems::CardGame, :count).by(1)
      end

      it "sets the config" do
        post game_systems_card_games_url, params: {game_systems_card_game: valid_attributes}
        expect(GameSystems::CardGame.last.game_config).to eq(game_config.with_indifferent_access)
      end

      it "redirects to the created card_game" do
        post game_systems_card_games_url, params: {game_systems_card_game: valid_attributes}
        expect(response).to redirect_to(GameSystems::CardGame.last)
      end
    end

    context "with invalid parameters" do
      it "does not create a new GameSystems::CardGame" do
        expect {
          post game_systems_card_games_url, params: {game_systems_card_game: invalid_attributes}
        }.to change(GameSystems::CardGame, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post game_systems_card_games_url, params: {game_systems_card_game: invalid_attributes}
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

      it "updates the requested card_game" do
        patch game_systems_card_game_url(card_game), params: {game_systems_card_game: new_attributes}
        card_game.reload
        expect(card_game.name).to eq("New name")
      end

      it "redirects to the card_game" do
        patch game_systems_card_game_url(card_game), params: {game_systems_card_game: new_attributes}
        card_game.reload
        expect(response).to redirect_to(game_systems_card_game_url(card_game))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        patch game_systems_card_game_url(card_game), params: {game_systems_card_game: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested game" do
      card_game
      expect {
        delete game_systems_card_game_url(card_game)
      }.to change(GameSystems::CardGame, :count).by(-1)
    end

    it "redirects to the games list" do
      delete game_systems_card_game_url(card_game)
      expect(response).to redirect_to(game_systems_url)
    end
  end
end
