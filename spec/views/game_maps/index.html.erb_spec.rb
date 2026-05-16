require 'rails_helper'

RSpec.describe "game_maps/index", type: :view do
  before(:each) do
    assign(:game_maps, [
      GameMap.create!(),
      GameMap.create!()
    ])
  end

  it "renders a list of game_maps" do
    render
    cell_selector = 'div>p'
  end
end
