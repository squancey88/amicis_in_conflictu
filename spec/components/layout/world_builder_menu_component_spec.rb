# frozen_string_literal: true

require "rails_helper"

RSpec.describe Layout::WorldBuilderMenuComponent, type: :component do
  let(:world) { create(:world) }
  context "in world building mode" do
    before do
      allow_any_instance_of(WorldsHelper).to receive(:current_world).and_return(world)
      render_inline(described_class.new(world_building: true))
    end

    it "should render" do
      expect(page).to have_css(".navbar")
    end
  end

  context "not in world building mode" do
    before do
      render_inline(described_class.new(world_building: false))
    end

    it "should render" do
      expect(page).not_to have_css(".navbar")
    end
  end
end
