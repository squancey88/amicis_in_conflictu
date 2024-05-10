# frozen_string_literal: true

require "rails_helper"

RSpec.describe ArmySelectorComponent, type: :component do
  let(:user) { create(:user) }
  let(:team) { create(:team, users: [user]) }
  let(:army) { create(:army, user:) }
  let(:army_list) { create(:army_list, army:, user:) }
  let(:player) { create(:player, :with_game, :with_user) }
  let(:player_team) { create(:player, :with_game, controller: team) }

  describe "player user" do
    before do
      render_inline(described_class.new(player:))
    end

    it "should have a btn" do
      expect(page).to have_css(".btn")
    end
  end
  describe "player team" do
    before do
      render_inline(described_class.new(player: player_team))
    end

    it "should have a btn" do
      expect(page).to have_css(".btn")
    end
  end
end
