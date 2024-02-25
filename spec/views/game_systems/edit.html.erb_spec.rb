require "rails_helper"

RSpec.describe "game_systems/edit", type: :view do
  before(:each) do
    @game_system = assign(:game_system, GameSystem.create!(
      name: "MyString"
    ))
  end

  it "renders the edit game_system form" do
    render

    assert_select "form[action=?][method=?]", game_system_path(@game_system), "post" do
      assert_select "input[name=?]", "game_system[name]"
    end
  end
end
