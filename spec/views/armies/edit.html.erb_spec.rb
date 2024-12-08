require "rails_helper"

RSpec.describe "armies/edit", type: :view do
  let(:army) { create(:army) }

  before(:each) do
    assign(:army, army)
  end

  it "renders the edit army form" do
    render

    assert_select "form[action=?][method=?]", army_path(army), "post" do
      assert_select "input[name=?]", "army[name]"
      assert_select "select[name=?]", "army[game_system_id]"
    end
  end
end
