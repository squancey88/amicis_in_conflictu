# frozen_string_literal: true

require "rails_helper"

RSpec.describe Quests::Events::SelectorComponent, type: :component do
  let(:world) { create(:world) }
  let(:campaign) { create(:campaign, world:) }
  let(:game) { create(:game, campaign:) }

  before do
    render_inline(described_class.new(game:))
  end

  it "renders two selects" do
    expect(page).to have_css("select", count: 2)
  end

  it "render link event button" do
    expect(page).to have_css("button", text: "Link Event")
  end
end
