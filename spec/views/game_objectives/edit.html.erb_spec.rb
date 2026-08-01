require 'rails_helper'

RSpec.describe "game_objectives/edit", type: :view do
  let(:game_objective) {
    GameObjective.create!()
  }

  before(:each) do
    assign(:game_objective, game_objective)
  end

  it "renders the edit game_objective form" do
    render

    assert_select "form[action=?][method=?]", game_objective_path(game_objective), "post" do
    end
  end
end
