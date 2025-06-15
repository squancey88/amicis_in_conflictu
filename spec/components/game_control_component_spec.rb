# frozen_string_literal: true

require "rails_helper"

RSpec.describe GameControlComponent, type: :component do
  let(:world) { create(:world) }
  let(:campaign) { create(:campaign, world:) }
  let(:user) { create(:user) }
  let(:game) { create(:game, campaign:) }
  let(:player) { create(:player, game:, controller: user) }

  before do
    render_inline(described_class.new(game:, player:))
  end

  it "renders control wrapper" do
    expect(page).to have_css("div.game-control")
  end

  it "renders icon buttons" do
    expect(page).to have_css("button i.bi", count: 3)
  end

  it "has three windows" do
    expect(page).to have_css("div.game-control__sub-window", count: 3)
  end

  it "renders status box" do
    expect(page).to have_css("div[data-game-control-target='status']")
  end
end
