require "rails_helper"

RSpec.describe "game_maps/new", type: :view do
  before(:each) do
    assign(:game_map, GameMap.new)
  end

  it "renders new game_map form" do
    render

    assert_select "form[action=?][method=?]", game_maps_path, "post" do
    end
  end
end
