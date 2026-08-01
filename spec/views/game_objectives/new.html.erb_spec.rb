require 'rails_helper'

RSpec.describe "game_objectives/new", type: :view do
  before(:each) do
    assign(:game_objective, GameObjective.new())
  end

  it "renders new game_objective form" do
    render

    assert_select "form[action=?][method=?]", game_objectives_path, "post" do
    end
  end
end
