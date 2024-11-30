# frozen_string_literal: true

require "rails_helper"

RSpec.describe Common::CardWithMenuComponent, type: :component do
  before do
    render_inline(described_class.new(title: "Test", menu_options: []))
  end

  it "should render title" do
    expect(page).to have_text("Test")
  end
end
