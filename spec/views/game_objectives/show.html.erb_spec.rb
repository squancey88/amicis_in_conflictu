require "rails_helper"

RSpec.describe "game_objectives/show", type: :view do
  let(:game_objective) { create(:game_objective) }

  before(:each) do
    assign(:game_objective, game_objective)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to have_text(game_objective.scoring_key)
    expect(rendered).to have_text(game_objective.game_system.name)
  end
end
