# frozen_string_literal: true

require "rails_helper"

RSpec.describe UnitTemplates::ListComponent, type: :component do
  let(:game_system) { create(:wargame) }
  before do
    render_inline(described_class.new(game_system:))
  end

  it "should render heading" do
    expect(page).to have_text("Unit Templates")
  end
end
