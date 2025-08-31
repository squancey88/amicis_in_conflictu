# frozen_string_literal: true

require "rails_helper"

RSpec.describe Organisations::ListItemComponent, type: :component do
  let(:world) { create(:world) }
  let(:organisation) { create(:organisation, world:) }

  before do
    render_inline(described_class.new(organisation:))
  end

  it "should render li" do
    expect(page).to have_css(".list-group-item", text: organisation.name)
  end

  it "should link to organisation" do
    expect(page).to have_link(organisation.name, href: "/worlds/#{world.id}/organisations/#{organisation.id}", target: "_top")
  end
end
