require "rails_helper"

RSpec.describe GameFormComponent, type: :component do
  let(:game_system) {
    create(:wargame, game_config: {
      scoring_system: :turn_based,
      turn_data: [
        {
          key: :test_key,
          type: :number,
          name: "Test",
          scoring: true
        }
      ]
    })
  }
  let(:game) { create(:game, game_system:) }

  before do
    render_inline described_class.new(game:)
  end

  it "should have number input" do
    expect(page).to have_css("input[name='test_key']")
  end
end
