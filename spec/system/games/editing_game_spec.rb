require "rails_helper"

RSpec.describe("Creating a Game", type: :system) do
  let!(:user) { create(:user, nickname: "User") }
  let!(:opponent) { create(:user, nickname: "Opponent") }
  let!(:gaming_group) { create(:gaming_group, members: [user, opponent]) }
  let!(:gaming_session) { create(:gaming_session, gaming_group:) }
  let!(:game) { create(:game, gaming_session:, game_system:, user_list: [user, opponent]) }

  before do
    login(user)
  end

  context "Wargame" do
    context "without objectives" do
      let!(:game_system) { create(:wargame, :turn_based, name: "Game Test", has_objectives: false) }

      it "should be able finish game" do
        visit game_path(game)

        select "Finished", from: "Game state"
        select "Game End", from: "Finish reason"

        click_on "Update Game"

        expect(current_path).to eq(game_path(game))

        game.reload

        expect(game).to be_finished
        expect(game.finish_reason).to eq("Game End")
      end

      it "can finish game, but then resume and edit again" do
        visit game_path(game)

        expect(page).to have_text("Turn Details")
        click_on "Add Turn"

        expect(page).to have_css("input[name*='turns']", count: 4)

        fill_in "Primary", with: 1, name: /0/
        fill_in "Secondary", with: 1, name: /0/

        select "Finished", from: "Game state"
        select "Game End", from: "Finish reason"

        click_on "Update Game"

        expect(current_path).to eq(game_path(game))

        select "In progress", from: "Game state"
        click_on "Update Game"

        expect(current_path).to eq(game_path(game))
      end

      it "should be able to add a turn add scores and save" do
        visit game_path(game)

        expect(page).to have_text("Turn Details")
        click_on "Add Turn"

        expect(page).to have_css("input[name*='turns']", count: 4)

        fill_in "Primary", with: 1, name: /0/
        fill_in "Secondary", with: 1, name: /0/

        click_on "Update Game"

        expect(page).to have_text("Game was successfully updated")

        game.reload

        expect(game.players[0].calculate_score).to eq(2)
      end

      context "with campaign" do
        let!(:game_system) { create(:wargame, :turn_based_with_campaign, name: "Game Test") }
        let(:campaign) { create(:campaign, game_system:) }
        let!(:game) { create(:game, gaming_session:, game_system:, user_list: [user, opponent], campaign:) }

        it "should be able finish game" do
          visit game_path(game)

          select "Finished", from: "Game state"
          select "Game End", from: "Finish reason"

          click_on "Update Game"

          expect(current_path).to eq(game_path(game))

          game.reload

          expect(game).to be_finished
          expect(game.finish_reason).to eq("Game End")
        end

        it "can edit campaign points" do
          visit game_path(game)

          fill_in "Rep", with: 2

          click_on "Update Game"
          expect(page).to have_text("Game was successfully updated")

          game.reload

          player = game.user_player(user)
          expect(player.campaign["changes"]["rep"]).to eq("2")
        end

        it "can finish game, but then resume and edit again" do
          visit game_path(game)

          expect(page).to have_text("Turn Details")
          click_on "Add Turn"

          expect(page).to have_css("input[name*='turns']", count: 4)

          fill_in "Primary", with: 1, name: /0/
          fill_in "Secondary", with: 1, name: /0/

          select "Finished", from: "Game state"
          select "Game End", from: "Finish reason"

          click_on "Update Game"

          expect(current_path).to eq(game_path(game))

          select "In progress", from: "Game state"
          click_on "Update Game"

          expect(current_path).to eq(game_path(game))
        end

        it "should be able to add a turn add scores and save" do
          visit game_path(game)

          expect(page).to have_text("Turn Details")
          click_on "Add Turn"

          expect(page).to have_css("input[name*='turns']", count: 4)

          fill_in "Primary", with: 1, name: /0/
          fill_in "Secondary", with: 1, name: /0/

          click_on "Update Game"
          expect(page).to have_text("Game was successfully updated")

          game.reload

          expect(game.players[0].calculate_score).to eq(2)
        end
      end
    end

    context "with objectives" do
      let!(:game_system) { create(:wargame, :turn_based, name: "Game Test", has_objectives: true) }
      let!(:primary_game_objectives) { create_list(:game_objective, 2, game_system: game_system) }
      let!(:secondary_game_objectives) { create_list(:game_objective, 2, game_system: game_system, scoring_key: :secondary) }

      it "should be able finish game" do
        visit game_path(game)

        select "Finished", from: "Game state"
        select "Game End", from: "Finish reason"

        click_on "Update Game"

        expect(current_path).to eq(game_path(game))

        game.reload

        expect(game).to be_finished
        expect(game.finish_reason).to eq("Game End")
      end

      it "can finish game, but then resume and edit again" do
        visit game_path(game)

        expect(page).to have_text("Turn Details")
        click_on "Add Turn"

        player_1_objective_selector = find(:testid, "player-0-turn-1-selector")
        objective = secondary_game_objectives.first

        within(player_1_objective_selector) do
          select objective.name
          click_on "Select"
        end

        input = find(:testid, "input-player-0-turn-1-objective-#{objective.id}")
        input.set(4)

        select "Finished", from: "Game state"
        select "Game End", from: "Finish reason"

        click_on "Update Game"

        expect(current_path).to eq(game_path(game))

        select "In progress", from: "Game state"
        click_on "Update Game"

        expect(current_path).to eq(game_path(game))
      end

      it "should be able to add a turn add scores and save" do
        visit game_path(game)

        expect(page).to have_text("Turn Details")
        click_on "Add Turn"

        player_1_objective_selector = find(:testid, "player-0-turn-1-selector")
        secondary_objective = secondary_game_objectives.first
        primary_objective = primary_game_objectives.first

        within(player_1_objective_selector) do
          select secondary_objective.name
          click_on "Select"
          select primary_objective.name
          click_on "Select"
        end

        input_sec = find(:testid, "input-player-0-turn-1-objective-#{secondary_objective.id}")
        input_sec.set(4)

        input_pri = find(:testid, "input-player-0-turn-1-objective-#{primary_objective.id}")
        input_pri.set(5)

        click_on "Update Game"

        expect(page).to have_text("Game was successfully updated")

        game.reload

        expect(game.players[0].calculate_score).to eq(9)
      end

      context "with campaign" do
        let!(:game_system) { create(:wargame, :turn_based_with_campaign, name: "Game Test", has_objectives: true) }
        let(:campaign) { create(:campaign, game_system:) }
        let!(:game) { create(:game, gaming_session:, game_system:, user_list: [user, opponent], campaign:) }

        it "should be able finish game" do
          visit game_path(game)

          select "Finished", from: "Game state"
          select "Game End", from: "Finish reason"

          click_on "Update Game"

          expect(current_path).to eq(game_path(game))

          game.reload

          expect(game).to be_finished
          expect(game.finish_reason).to eq("Game End")
        end

        it "can edit campaign points" do
          visit game_path(game)

          fill_in "Rep", with: 2

          click_on "Update Game"
          expect(page).to have_text("Game was successfully updated")

          game.reload

          player = game.user_player(user)
          expect(player.campaign["changes"]["rep"]).to eq("2")
        end

        it "can finish game, but then resume and edit again" do
          visit game_path(game)

          expect(page).to have_text("Turn Details")
          click_on "Add Turn"

          player_1_objective_selector = find(:testid, "player-0-turn-1-selector")
          objective = secondary_game_objectives.first

          within(player_1_objective_selector) do
            select objective.name
            click_on "Select"
          end

          input = find(:testid, "input-player-0-turn-1-objective-#{objective.id}")
          input.set(4)

          select "Finished", from: "Game state"
          select "Game End", from: "Finish reason"

          click_on "Update Game"

          expect(current_path).to eq(game_path(game))

          select "In progress", from: "Game state"
          click_on "Update Game"

          expect(current_path).to eq(game_path(game))
        end

        it "should be able to add a turn add scores and save" do
          visit game_path(game)

          expect(page).to have_text("Turn Details")
          click_on "Add Turn"

          player_1_objective_selector = find(:testid, "player-0-turn-1-selector")
          objective = secondary_game_objectives.first

          within(player_1_objective_selector) do
            select objective.name
            click_on "Select"
          end

          input = find(:testid, "input-player-0-turn-1-objective-#{objective.id}")
          input.set(4)

          click_on "Update Game"
          expect(page).to have_text("Game was successfully updated")

          game.reload

          expect(game.players[0].calculate_score).to eq(4)
        end
      end
    end
  end
end
