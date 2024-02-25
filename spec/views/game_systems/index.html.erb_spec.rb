require "rails_helper"

RSpec.describe "game_systems/index", type: :view do
  before(:each) do
    assign(:game_systems, [
      GameSystem.create!(
        name: "Name"
      ),
      GameSystem.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of game_systems" do
    render
    assert_select "span", text: "Name".to_s, count: 2
  end
end
