require "rails_helper"

RSpec.describe "game_systems/new", type: :view do
  before(:each) do
    assign(:game_system, GameSystem.new(
      name: "MyString"
    ))
  end

  it "renders new game_system form" do
    render

    assert_select "form[action=?][method=?]", game_systems_path, "post" do
      assert_select "input[name=?]", "game_system[name]"
    end
  end
end
