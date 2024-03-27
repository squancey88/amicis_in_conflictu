# frozen_string_literal: true

require "rails_helper"

RSpec.describe GamingGroupCardComponent, type: :component do
  let(:gaming_group) { create(:gaming_group) }

  before do
    render_inline(described_class.new(gaming_group:))
  end

  it "should render a card" do
    expect(page).to have_css(".card")
  end
end
