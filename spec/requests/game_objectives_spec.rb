require "rails_helper"

RSpec.describe "/game_objectives", type: :request do
  let(:user) { create(:user) }
  let(:game_system) { create(:wargame) }
  let!(:game_objective) { create(:game_objective, game_system:) }

  let(:valid_attributes) {
    {
      name: Faker::Lorem.word,
      game_system_id: game_system.id,
      scoring_key: :secondary
    }
  }

  let(:invalid_attributes) {
    {
      name: nil,
      game_system_id: nil,
      scoring_key: nil
    }
  }

  before do
    sign_in(user)
  end

  describe "GET /show" do
    it "renders a successful response" do
      get game_objective_url(game_objective)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_game_objective_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      get edit_game_objective_url(game_objective)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new GameObjective" do
        expect {
          post game_objectives_url, params: {game_objective: valid_attributes}
        }.to change(GameObjective, :count).by(1)
      end

      it "redirects to the created game_objective" do
        post game_objectives_url, params: {game_objective: valid_attributes}
        expect(response).to redirect_to(game_objective_url(GameObjective.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new GameObjective" do
        expect {
          post game_objectives_url, params: {game_objective: invalid_attributes}
        }.to change(GameObjective, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post game_objectives_url, params: {game_objective: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {name: "New Name"}
      }

      it "updates the requested game_objective" do
        patch game_objective_url(game_objective), params: {game_objective: new_attributes}
        game_objective.reload
        expect(game_objective.name).to eq("New Name")
      end

      it "redirects to the game_objective" do
        patch game_objective_url(game_objective), params: {game_objective: new_attributes}
        game_objective.reload
        expect(response).to redirect_to(game_objective_url(game_objective))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        patch game_objective_url(game_objective), params: {game_objective: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested game_objective" do
      expect {
        delete game_objective_url(game_objective)
      }.to change(GameObjective, :count).by(-1)
    end

    it "redirects to the game_objectives list" do
      delete game_objective_url(game_objective)
      expect(response).to redirect_to(game_objectives_url)
    end
  end
end
