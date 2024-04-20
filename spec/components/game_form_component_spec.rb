require "rails_helper"

RSpec.describe GameFormComponent, type: :component do
  let(:game_system) { create(:wargame, :turn_based) }
  let(:game) { create(:game, game_system:) }

  before do
    render_inline described_class.new(game:)
  end

  it "should render the TurnBasedGameFormComponent" do
    expect(page).to have_css(".turn-grid")
  end
end
