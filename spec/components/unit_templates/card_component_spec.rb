# frozen_string_literal: true

require "rails_helper"

RSpec.describe UnitTemplates::CardComponent, type: :component do
  let(:unit_template) { create(:unit_template) }

  before do
    render_inline(described_class.new(unit_template:))
  end

  it "should render card" do
    expect(page).to have_css(".card")
  end
end
