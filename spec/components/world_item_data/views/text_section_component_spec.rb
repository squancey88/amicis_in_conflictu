# frozen_string_literal: true

require "rails_helper"

RSpec.describe WorldItemData::Views::TextSectionComponent, type: :component do
  let(:owner) { create(:user) }
  let(:normal_user) { create(:user) }

  let(:world) { create(:world, owner:) }

  let(:article) { create(:article, world:) }
  let(:gm_only_text_section) { create(:text_section, relates_to: article, visibility: :gm_only) }
  let(:visible_text_section) { create(:text_section, relates_to: article, visibility: :visible) }

  context "as owner user" do
    before do
      allow_any_instance_of(AuthHelper).to receive(:current_user).and_return(owner)
      render_inline(described_class.new(section: gm_only_text_section))
    end

    it "should render title" do
      expect(page).to have_css("h2", text: gm_only_text_section.title)
    end
  end

  context "as normal user" do
    before do
      allow_any_instance_of(AuthHelper).to receive(:current_user).and_return(normal_user)
    end
    context "GM only item" do
      before do
        render_inline(described_class.new(section: gm_only_text_section))
      end

      it "should not render" do
        expect(page).not_to have_css(".text-section")
      end
    end

    context "visible item" do
      before do
        render_inline(described_class.new(section: visible_text_section))
      end

      it "should render" do
        expect(page).to have_css(".text-section")
      end

      it "should render title" do
        expect(page).to have_css("h2", text: visible_text_section.title)
      end

      it "should render text" do
        expect(page).to have_css(".text-editor-render-component")
      end
    end
  end
end
