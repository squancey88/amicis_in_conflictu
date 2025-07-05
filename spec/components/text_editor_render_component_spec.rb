# frozen_string_literal: true

require "rails_helper"

RSpec.describe TextEditorRenderComponent, type: :component do
  let(:content) {
    {
      time: 1714678203542,
      blocks: [
        generate_paragraph_block(text: "Something something dark side"),
        generate_header_block(text: "Hello world", level: 1),
        generate_unordered_list_block(items: [
          generate_list_item(content: "First item"),
          generate_list_item(content: "Second item")
        ]),
        generate_ordered_list_block(items: [
          generate_list_item(content: "Count 1"),
          generate_list_item(content: "Count 2")
        ])
      ],
      version: "2.29.1"
    }.to_json
  }
  let(:world_no_content) { create(:world) }
  let(:world_with_content) { create(:world, blurb: content) }

  context "No content" do
    before do
      render_inline(described_class.new(model: world_no_content, attribute: :blurb))
    end

    it "does not render" do
      expect(page).not_to have_css(".text-editor-render-component")
    end
  end

  context "With content" do
    before do
      render_inline(described_class.new(model: world_with_content, attribute: :blurb))
    end

    it "renders" do
      expect(page).to have_css(".text-editor-render-component")
    end

    it "renders a paragraph" do
      expect(page).to have_css("p", text: "Something something dark side")
    end

    it "renders a header" do
      expect(page).to have_css("h1", text: "Hello world")
    end

    it "renders an unordered list" do
      within("ul") do
        expect(page).to have_css("li", text: "First item")
        expect(page).to have_css("li", text: "Second Item")
      end
    end

    it "renders an ordered list" do
      within("ol") do
        expect(page).to have_css("li", text: "Count 1")
        expect(page).to have_css("li", text: "Count 2")
      end
    end
  end
end
