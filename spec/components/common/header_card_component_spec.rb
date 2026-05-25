# frozen_string_literal: true

require "rails_helper"

RSpec.describe Common::HeaderCardComponent, type: :component do
  before do
    render_inline(described_class.new(title: "Test"))
  end

  it "should render" do
    expect(page).to have_css(".aic-title-with-buttons")
    expect(page).to have_text("Test")
  end
end
