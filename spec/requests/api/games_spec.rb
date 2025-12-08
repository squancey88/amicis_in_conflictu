require "rails_helper"

RSpec.describe "/api/games", type: :request do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let(:other_user) { create(:user) }
  let(:gaming_group) { create(:gaming_group, owners: [user, user2]) }
  let(:gaming_session) { create(:gaming_session, gaming_group:) }
  let(:game) { create(:game, gaming_session:) }
  let(:game_system) { create(:wargame, :turn_based) }
  let(:new_game_system) { create(:wargame) }
  let(:valid_attributes) {
    {
      gaming_session_id: gaming_session.id,
      game_system_id: game_system.id,
      players_attributes: [
        {controller_id: user.id, controller_type: "User"},
        {controller_id: user2.id, controller_type: "User"}
      ]
    }
  }

  let(:invalid_attributes) {
    {
      gaming_session_id: nil,
      game_system_id: nil
    }
  }

  describe "without auth" do
    describe "show" do
      it "should be unauthorized" do
        get api_game_path(game)
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe "as different user" do
    describe "show" do
      before do
        get_with_token(other_user, api_game_path(game))
      end

      it "should be forbidden" do
        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  describe "with jwt login" do
    describe "show" do
      before do
        get_with_token(user, api_game_path(game))
      end

      it "should be authorized" do
        expect(response).to have_http_status(:successful)
      end

      it "returns hash" do
        expect(JSON.parse(response.body)).to be_an(Hash)
      end
    end

    describe "create" do
      it "creates valid record with valid data" do
        expect {
          post_with_token(user, api_games_path, params: {game: valid_attributes})
        }.to change(Game, :count).by(1)
      end

      it "does not create record with invalid data" do
        expect {
          post_with_token(user, api_games_path, params: {game: invalid_attributes})
        }.not_to change(Game, :count)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    describe "update" do
      context "with valid parameters" do
        let(:new_attributes) {
          {
            game_system_id: new_game_system.id
          }
        }

        it "updates the requested game" do
          patch_with_token(user, api_game_url(game), params: {game: new_attributes})
          game.reload
          expect(game.game_system).to eq(new_game_system)
        end

        context "with external data" do
          let(:new_attributes) {
            {
              game_system_id: new_game_system.id,
              data: {
                external_data: {
                  start_health: 40,
                  turn_tracking: [
                    {end_time: "2025-11-03T19:45:28.473Z", start_time: "2025-11-03T19:45:26.721Z", current_player_index: 0},
                    {end_time: "2025-11-03T19:46:27.155Z", start_time: "2025-11-03T19:45:28.476Z"},
                    {end_time: "2025-11-03T19:46:30.867Z", start_time: "2025-11-03T19:46:27.158Z", current_player_index: 0},
                    {end_time: "2025-11-03T19:46:37.332Z", start_time: "2025-11-03T19:46:30.870Z", current_player_index: 1},
                    {end_time: "2025-11-03T19:46:56.881Z", start_time: "2025-11-03T19:46:37.335Z", current_player_index: 2}
                  ]
                }
              }
            }
          }

          it "with external data" do
            patch_with_token(user, api_game_url(game), params: {game: new_attributes})
            game.reload
            expect(game.game_system).to eq(new_game_system)
            expect(game.data["external_data"]["start_health"]).to eq("40")
            expect(game.data["external_data"]["turn_tracking"].length).to eq(5)
            expect(game.data["external_data"]["turn_tracking"].first["current_player_index"]).to eq("0")
          end
        end
      end
    end
  end
end
