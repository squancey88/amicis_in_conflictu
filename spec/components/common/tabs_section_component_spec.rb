# frozen_string_literal: true

require "rails_helper"

RSpec.describe Common::TabsSectionComponent, type: :component do
  context "with no selected index" do
    before do
      render_inline(described_class.new) do |component|
        component.with_tab(label: "Tab 1") { "Tab 1 content" }
        component.with_tab(label: "Tab 2") { "Tab 2 content" }
      end
    end

    it "should render tabs" do
      expect(page).to have_css("li.nav-item", text: "Tab 1")
      expect(page).to have_css("li.nav-item", text: "Tab 2")
    end

    it "should render content" do
      expect(page).to have_text("Tab 1 content")
      expect(page).to have_text("Tab 2 content")
    end

    it "should set the first tab to selected" do
      expect(page).to have_css("button.nav-link.active", text: "Tab 1")
      expect(page).to have_css("div.tab-pane.show.active", text: /Tab 1 content/)
    end
  end

  context "with no selected index" do
    before do
      render_inline(described_class.new(selected_index: 1)) do |component|
        component.with_tab(label: "Tab 1") { "Tab 1 content" }
        component.with_tab(label: "Tab 2") { "Tab 2 content" }
      end
    end

    it "should set the second tab to selected" do
      expect(page).to have_css("button.nav-link.active", text: "Tab 2")
      expect(page).to have_css("div.tab-pane.show.active", text: /Tab 2 content/)
    end
  end
end
