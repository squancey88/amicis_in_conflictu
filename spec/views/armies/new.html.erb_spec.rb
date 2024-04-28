require "rails_helper"

RSpec.describe "armies/new", type: :view do
  before(:each) do
    assign(:army, Army.new(user: create(:user)))
  end

  it "renders new army form" do
    render

    assert_select "form[action=?][method=?]", armies_path, "post" do
      assert_select "input[name=?]", "army[name]"

      assert_select "select[name=?]", "army[game_system_id]"

      assert_select "input[name=?]", "army[user_id]"
    end
  end
end
