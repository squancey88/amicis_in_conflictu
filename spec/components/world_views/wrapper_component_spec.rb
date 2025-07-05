# frozen_string_literal: true

require "rails_helper"

RSpec.describe WorldViews::WrapperComponent, type: :component do
  let(:owner) { create(:user) }
  let(:viewer) { create(:user) }
  let(:world) { create(:world, owner:) }
  let(:character) { create(:character, world:) }

  context "as owner" do
    before do
      allow_any_instance_of(AuthHelper).to receive(:current_user).and_return(owner)
      render_inline(described_class.new(record: character))
    end

    it "should render world link" do
      expect(page).to have_link(world.name, href: "/worlds/#{world.id}")
    end

    it "should render edit link" do
      expect(page).to have_link(href: "/characters/#{character.id}/edit")
    end
  end

  context "as viewer" do
    before do
      allow_any_instance_of(AuthHelper).to receive(:current_user).and_return(viewer)
      render_inline(described_class.new(record: character))
    end

    it "render world link" do
      expect(page).to have_link(world.name, href: "/worlds/#{world.id}")
    end

    it "not render edit link" do
      expect(page).not_to have_link(href: "/characters/#{character.id}/edit")
    end
  end
end
