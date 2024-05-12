require "rails_helper"

RSpec.describe SessionGameListComponent, type: :component do
  let(:gaming_session) { create(:gaming_session) }
  let(:wargame) { create(:wargame) }
  let(:game) {
    create(:game, gaming_session:, game_system: wargame)
  }

  before do
    game
    render_inline(described_class.new(gaming_session:))
  end

  it "should have the box title" do
    expect(page).to have_css("h3", text: "Games")
  end
end
