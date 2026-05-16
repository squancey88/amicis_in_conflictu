require 'rails_helper'

RSpec.describe "game_maps/show", type: :view do
  before(:each) do
    assign(:game_map, GameMap.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
