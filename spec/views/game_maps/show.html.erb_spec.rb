require "rails_helper"

RSpec.describe "game_maps/show", type: :view do
  let(:game_map) { create(:game_map) }
  before(:each) do
    assign(:game_map, game_map)
    assign(:presenter, GameMapPresenter.new(double, game_map))
  end

  it "renders attributes in <p>" do
    render
  end
end
