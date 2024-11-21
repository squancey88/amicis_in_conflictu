# frozen_string_literal: true

require "rails_helper"

RSpec.describe ArmySelectorComponent, type: :component do
  let(:user) { create(:user) }
  let(:team) { create(:team, users: [user]) }
  let(:army) { create(:army, user:) }
  let(:army_list) { create(:army_list, army:, user:) }
  let(:current_player) { create(:player, :with_game, :with_user) }
  let(:player_team) { create(:player, :with_game, controller: team) }
  let(:player_form) { double }

  describe "player user" do
    before do
      render_inline(described_class.new(player_form:, current_player:, player_index: 0))
    end

    it "should have a btn" do
      expect(page).to have_css(".btn")
    end
  end
  describe "player team" do
    before do
      render_inline(described_class.new(player_form:, current_player: player_team, player_index: 1))
    end

    it "should have a btn" do
      expect(page).to have_css(".btn")
    end
  end
end
