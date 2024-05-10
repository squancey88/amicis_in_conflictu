# frozen_string_literal: true

require "rails_helper"

RSpec.describe ArmyListComponent, type: :component do
  let(:army) { create(:army) }

  before do
    create_list(:army_list, 2, army:)
    render_inline(described_class.new(army:))
  end

  it "should render army cards" do
    expect(page).to have_css(".card", count: 2)
  end
end
