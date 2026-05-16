require "rails_helper"

RSpec.describe "game_maps/edit", type: :view do
  let(:game_map) {
    create(:game_map)
  }

  before(:each) do
    assign(:game_map, game_map)
  end

  it "renders the edit game_map form" do
    render
  end
end
