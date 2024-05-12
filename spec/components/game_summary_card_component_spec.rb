# frozen_string_literal: true

require "rails_helper"

RSpec.describe GameSummaryCardComponent, type: :component do
  let(:gaming_session) { create(:gaming_session) }
  let(:wargame) { create(:wargame) }
  let(:game) {
    create(:game, gaming_session:, game_system: wargame)
  }

  before do
    game
    render_inline(described_class.new(game:))
  end

  it "should show the gaming system name" do
    expect(page).to have_css(".card-title", text: wargame.name)
  end
end
