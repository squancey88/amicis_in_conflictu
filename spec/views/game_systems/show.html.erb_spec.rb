require "rails_helper"

RSpec.describe "game_systems/show", type: :view do
  before(:each) do
    @game_system = assign(:game_system, GameSystem.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
