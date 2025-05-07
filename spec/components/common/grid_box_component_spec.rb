# frozen_string_literal: true

require "rails_helper"

RSpec.describe Common::GridBoxComponent, type: :component do
  context "not as box" do
    before do
      render_inline(described_class.new)
    end

    it "should render div" do
      expect(page).to have_css("div.col")
    end
  end

  context "as box" do
    before do
      render_inline(described_class.new(as_box: true, title: "test"))
    end

    it "should render div" do
      expect(page).to have_css("div.col")
    end

    it "should render standard layout box" do
      expect(page).to have_css(".standard-box_header-text", text: "test")
    end
  end
end
