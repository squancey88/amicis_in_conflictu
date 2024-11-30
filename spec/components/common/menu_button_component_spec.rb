# frozen_string_literal: true

require "rails_helper"

RSpec.describe Common::MenuButtonComponent, type: :component do
  before do
    render_inline(described_class.new(menu_options: [
      {text: "Test", link: "/"}
    ]))
  end

  it "should render link" do
    expect(page).to have_link("Test", href: "/")
  end

  it "should have default icon" do
    expect(page).to have_css("i.bi.bi-gear-fill")
  end
end
