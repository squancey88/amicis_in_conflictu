# frozen_string_literal: true

require "rails_helper"

RSpec.describe WorldViews::WrapperComponent, type: :component do
  let(:owner) { create(:user) }
  let(:viewer) { create(:user) }
  let(:world) { create(:world, owner:) }
  let(:character) { create(:character, world:) }
  let(:character_owner_notes) { create(:character, world:, world_owner_notes: generate_text_section) }

  context "as owner" do
    context "without owner notes" do
      before do
        allow_any_instance_of(AuthHelper).to receive(:current_user).and_return(owner)
        render_inline(described_class.new(record: character))
      end

      it "should render world link" do
        expect(page).to have_link(world.name, href: "/worlds/#{world.id}")
      end

      it "should render edit link" do
        expect(page).to have_link(href: "/worlds/#{world.id}/characters/#{character.id}/edit")
      end

      it "not show world owner notes" do
        expect(page).not_to have_css("div[data-test-world-owner-notes]")
      end
    end

    context "with owner notes" do
      before do
        allow_any_instance_of(AuthHelper).to receive(:current_user).and_return(owner)
        render_inline(described_class.new(record: character_owner_notes))
      end

      it "should show world owner notes" do
        expect(page).to have_css("div[data-test-world-owner-notes]")
      end
    end
  end

  context "as viewer" do
    before do
      allow_any_instance_of(AuthHelper).to receive(:current_user).and_return(viewer)
      render_inline(described_class.new(record: character_owner_notes))
    end

    it "render world link" do
      expect(page).to have_link(world.name, href: "/worlds/#{world.id}")
    end

    it "not render edit link" do
      expect(page).not_to have_link(href: "/characters/#{character.id}/edit")
    end

    it "should show world owner notes" do
      expect(page).not_to have_css("div[data-test-world-owner-notes]")
    end
  end
end
