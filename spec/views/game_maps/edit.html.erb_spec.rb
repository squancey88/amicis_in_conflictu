require 'rails_helper'

RSpec.describe "game_maps/edit", type: :view do
  let(:game_map) {
    GameMap.create!()
  }

  before(:each) do
    assign(:game_map, game_map)
  end

  it "renders the edit game_map form" do
    render

    assert_select "form[action=?][method=?]", game_map_path(game_map), "post" do
    end
  end
end
