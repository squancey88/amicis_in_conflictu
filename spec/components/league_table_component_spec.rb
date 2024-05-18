# frozen_string_literal: true

require "rails_helper"

RSpec.describe LeagueTableComponent, type: :component do
  let(:gaming_group) { create(:gaming_group) }
  before do
    render_inline(described_class.new(gaming_group:))
  end

  it "should have tabs" do
    expect(page).to have_css("ul.nav")
  end

  it "should have tabs container" do
    expect(page).to have_css(".tab-content")
  end

  it "should draw two tables" do
    expect(page).to have_css("table", count: 2)
  end
end
