# frozen_string_literal: true

require "rails_helper"

RSpec.describe PlayerForms::RolePlayingGame::MyCharactersComponent, type: :helper do
  include ViewComponent::TestHelpers

  let!(:campaign) { create(:campaign) }
  let(:game) { create(:game, campaign:) }
  let(:user) { create(:user) }
  let(:current_player) { create(:player, game:, controller: user) }
  let!(:player_character) {
    create(:player_character,
      controlled_by: user,
      campaign:,
      given_name: "The",
      family_name: "Batman")
  }

  before do
    allow_any_instance_of(AuthHelper).to receive(:current_user).and_return(user)
    form_with model: game do |player_form|
      render_inline(described_class.new(game:, player_form:, current_player:, player_index: 0))
    end
  end

  it "should render characters name" do
    expect(page).to have_text("The Batman")
  end
end
