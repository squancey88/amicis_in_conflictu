require "rails_helper"

RSpec.describe "game_maps/index", type: :view do
  before(:each) do
    assign(:game_maps, create_list(:game_map, 2))
    assign(:presenter, GameMapsPresenter.new(double))
  end

  it "renders a list of game_maps" do
    render
    "div>p"
  end
end
