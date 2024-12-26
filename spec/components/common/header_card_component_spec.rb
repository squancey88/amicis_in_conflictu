# frozen_string_literal: true

require "rails_helper"

RSpec.describe Common::HeaderCardComponent, type: :component do
  before do
    render_inline(described_class.new(title: "test"))
  end

  it "should render a card" do
    expect(page).to have_css(".card")
  end
end
