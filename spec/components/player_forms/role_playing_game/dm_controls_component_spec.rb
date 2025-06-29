# frozen_string_literal: true

require "rails_helper"

RSpec.describe PlayerForms::RolePlayingGame::DmControlsComponent, type: :helper do
  include ViewComponent::TestHelpers

  let(:user) { create(:user) }
  let!(:campaign) { create(:campaign, game_master: user) }
  let(:game) { create(:game, campaign:) }
  let(:current_player) { create(:player, game:, controller: user) }

  before do
    allow_any_instance_of(AuthHelper).to receive(:current_user).and_return(user)
    form_with model: game do |player_form|
      render_inline(described_class.new(game:, player_form:, current_player:, player_index: 0))
    end
  end

  it "should render characters name" do
    expect(page).to have_link("Launch DM Mode", href: dm_mode_game_path(game))
  end
end
