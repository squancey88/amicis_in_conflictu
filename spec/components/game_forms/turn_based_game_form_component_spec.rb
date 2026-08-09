# frozen_string_literal: true

require "rails_helper"

RSpec.describe GameForms::TurnBasedComponent, type: :component do
  let(:game) { create(:game, game_system:) }

  context "without objectives" do
    let(:game_system) { create(:wargame, :turn_based, has_objectives: false) }

    context "without data" do
      before do
        render_inline(described_class.new(game:, form: nil, user_player: nil))
      end

      it "should render raw score react component" do
        expect(page).to have_css("div")
        expect(page).to have_component_with_props("RawScoreTurnForm", {
          "players" => react_props(PlayerSerializer.new(game.players)),
          "gameSystem" => react_props(GameSystemSerializer.new(game_system)),
          "editable" => true
        })
      end
    end

    context "with data" do
      before do
        player1 = game.players.first
        player2 = game.players.last

        player1.turns = [
          {primary: 0, secondary: 5},
          {primary: 10, secondary: 5}
        ]
        player2.turns = [
          {primary: 0, secondary: 8},
          {primary: 8, secondary: 8}
        ]
        player1.save!
        player2.save!
        game.reload
        render_inline(described_class.new(game:, form: nil, user_player: nil))
      end

      it "should render raw score react component" do
        expect(page).to have_css("div")
        expect(page).to have_component_with_props("RawScoreTurnForm", {
          "players" => react_props(PlayerSerializer.new(game.players)),
          "gameSystem" => react_props(GameSystemSerializer.new(game_system)),
          "editable" => true
        })
      end
    end
  end

  context "with objectives" do
    let(:game_system) { create(:wargame, :turn_based, has_objectives: true) }
    let!(:game_objectives) { create_list(:game_objective, 2, game_system: game_system) }

    context "without data" do
      before do
        render_inline(described_class.new(game:, form: nil, user_player: nil))
      end

      it "should render turn based react component" do
        expect(page).to have_css("div")
        expect(page).to have_component_with_props("ObjectiveBasedTurnForm", {
          "players" => react_props(PlayerSerializer.new(game.players)),
          "gameSystem" => react_props(GameSystemSerializer.new(game_system, with_traits: [:with_objectives])),
          "editable" => true
        })
      end
    end

    context "with data" do
      let!(:turn_objective) { create(:turn_objective, player: game.players.first, game_objective: game_objectives.first) }

      before do
        render_inline(described_class.new(game:, form: nil, user_player: nil))
      end

      it "should render turn based react component" do
        expect(page).to have_css("div")
        expect(page).to have_component_with_props("ObjectiveBasedTurnForm", {
          "players" => react_props(PlayerSerializer.new(game.players)),
          "gameSystem" => react_props(GameSystemSerializer.new(game_system, with_traits: [:with_objectives])),
          "editable" => true
        })
      end
    end

    context "with old turn based data" do
      before do
        player1 = game.players.first
        player2 = game.players.last

        player1.turns = [
          {primary: 0, secondary: 5},
          {primary: 10, secondary: 5}
        ]
        player2.turns = [
          {primary: 0, secondary: 8},
          {primary: 8, secondary: 8}
        ]
        player1.save!
        player2.save!
        game.reload
        render_inline(described_class.new(game:, form: nil, user_player: nil))
      end

      it "should render old raw score version" do
        expect(page).to have_css("div")
        expect(page).to have_component_with_props("RawScoreTurnForm", {
          "players" => react_props(PlayerSerializer.new(game.players)),
          "gameSystem" => react_props(GameSystemSerializer.new(game_system)),
          "editable" => true
        })
      end
    end
  end
end
