# frozen_string_literal: true

require "rails_helper"

RSpec.describe GameForms::TurnBasedComponent, type: :component do
  let(:game_system) { create(:wargame, :turn_based) }
  let(:game) { create(:game, game_system:) }

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

    it "should render turn based react component" do
      expect(page).to have_css("div")
      expect(rendered_content).to have_component_with_props("TurnBasedGameForm", {
        players: PlayerSerializer.new(game.players).as_json,
        game_system: GameSystemSerializer.new(game_system, with_traits: [:with_objectives]).as_json,
        editable: true
      })
    end
  end
end
