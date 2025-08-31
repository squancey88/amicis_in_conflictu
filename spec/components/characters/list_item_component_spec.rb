# frozen_string_literal: true

require "rails_helper"

RSpec.describe Characters::ListItemComponent, type: :component do
  let(:world) { create(:world) }
  let(:character) { create(:character, world:) }

  before do
    render_inline(described_class.new(character:))
  end

  it "should render li" do
    expect(page).to have_css(".list-group-item", text: character.full_name)
  end

  it "should link to character" do
    expect(page).to have_link(character.full_name, href: "/worlds/#{world.id}/characters/#{character.id}", target: "_top")
  end
end
