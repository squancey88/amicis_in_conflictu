require "rails_helper"

RSpec.describe "game_systems/index", type: :view do
  before(:each) do
    assign(:game_systems, [
      GameSystems::Wargame.create!(
        name: "Name",
        slug: "name-test-1"
      ),
      GameSystems::Wargame.create!(
        name: "Name",
        slug: "name-test-2"
      )
    ])
  end

  it "renders a list of game_systems" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 4
  end
end
