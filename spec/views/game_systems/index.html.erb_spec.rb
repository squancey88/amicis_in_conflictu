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
    expect(rendered).to have_css(".card", count: 3)
  end
end
