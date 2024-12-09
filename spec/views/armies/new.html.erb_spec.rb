require "rails_helper"

RSpec.describe "armies/new", type: :view do
  before(:each) do
    assign(:army, Army.new(game_system: create(:wargame)))
  end

  it "renders new army form" do
    render

    assert_select "form[action=?][method=?]", armies_path, "post" do
      assert_select "input[name=?]", "army[name]"
      assert_select "select[name=?]", "army[game_system_id]"
    end
  end
end
