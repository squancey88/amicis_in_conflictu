# frozen_string_literal: true

require "rails_helper"

RSpec.describe GameForms::CampaignAttributesComponent, type: :helper do
  include ViewComponent::TestHelpers

  context "with list_cost_change_in_game being true" do
    let(:game_system) { create(:wargame, :turn_based_with_campaign, list_cost_change_in_game: true) }
    let(:game) { create(:game, game_system:) }

    before do
      form_with model: game do |form|
        render_inline(described_class.new(game:, user_player: game.players.first, form:))
      end
    end

    it "should render campaign attribute input" do
      expect(page).to have_css("input[name*='rep']")
    end

    it "should render list_cost input" do
      expect(page).to have_css("input[name*='list_cost_change']")
    end
  end

  context "with list_cost_change_in_game being false" do
    let(:game_system) { create(:wargame, :turn_based_with_campaign) }
    let(:game) { create(:game, game_system:) }

    before do
      form_with model: game do |form|
        render_inline(described_class.new(game:, user_player: game.players.first, form:))
      end
    end

    it "should render campaign attribute input" do
      expect(page).to have_css("input[name*='rep']")
    end

    it "should not render list_cost input" do
      expect(page).not_to have_css("input[name*='list_cost_change']")
    end
  end
end
