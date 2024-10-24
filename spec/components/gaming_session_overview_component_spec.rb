# frozen_string_literal: true

require "rails_helper"

RSpec.describe GamingSessionOverviewComponent, type: :component do
  let(:gaming_session) { create(:gaming_session) }
  before do
    render_inline(described_class.new(gaming_session:))
  end

  it "should have a card" do
    expect(page).to have_css(".card")
  end

  it "should display message when no games" do
    expect(page).to have_css("p", text: "No games played")
  end
end
