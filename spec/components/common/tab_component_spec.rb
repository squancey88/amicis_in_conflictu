# frozen_string_literal: true

require "rails_helper"

RSpec.describe Common::TabComponent, type: :component do
  before do
    render_inline(described_class.new(label: "Test")) { "test content" }
  end

  it "should render content" do
    expect(page).to have_text("test content")
  end
end
