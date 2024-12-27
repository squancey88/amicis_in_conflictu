# frozen_string_literal: true

require "rails_helper"

RSpec.describe TextEditorRenderComponent, type: :component do
  let(:content) {
    {
      time: 1714678203542,
      blocks: [
        {id: "Wk4L5wcZCZ", type: "paragraph", data: {text: "Something something dark side"}}
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

    it "should not render" do
      expect(page).not_to have_css(".text-editor-render-component")
    end
  end

  context "With content" do
    before do
      render_inline(described_class.new(model: world_with_content, attribute: :blurb))
    end

    it "should not render" do
      expect(page).to have_css(".text-editor-render-component")
    end
  end
end
