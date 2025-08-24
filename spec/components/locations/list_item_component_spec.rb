# frozen_string_literal: true

require "rails_helper"

RSpec.describe Locations::ListItemComponent, type: :component do
  let(:world) { create(:world) }

  before do
    render_inline(described_class.new(location:))
  end

  context "without parent" do
    let(:location) { create(:location, world:) }

    it "should render li" do
      expect(page).to have_css(".list-group-item", text: location.name)
    end

    it "should link to location" do
      expect(page).to have_link(location.name, href: "/worlds/#{world.id}/locations/#{location.id}", target: "_top")
    end
  end

  context "with parent" do
    let(:grandparent_location) { create(:location, world:, name: "GP") }
    let(:parent_location) { create(:location, world:, located_in: grandparent_location, name: "P") }
    let(:location) { create(:location, world:, located_in: parent_location, name: "Main") }

    it "should render li" do
      expect(page).to have_css(".list-group-item")
    end

    it "should link to location" do
      expect(page).to have_link("Main", href: "/worlds/#{world.id}/locations/#{location.id}", target: "_top")
    end

    it "should show breadcrumbs" do
      expect(page).to have_css(".fw-lighter", text: "GP > P")
    end
  end
end
