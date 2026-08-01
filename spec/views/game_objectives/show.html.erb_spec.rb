require 'rails_helper'

RSpec.describe "game_objectives/show", type: :view do
  before(:each) do
    assign(:game_objective, GameObjective.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
