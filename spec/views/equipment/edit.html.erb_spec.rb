require "rails_helper"

RSpec.describe "equipment/edit", type: :view do
  let(:equipment) { create(:equipment) }
  before(:each) do
    assign(:equipment, equipment)
  end

  it "renders the edit equipment form" do
    render

    assert_select "form[action=?][method=?]", equipment_path(equipment), "post" do
      assert_select "input[name=?]", "equipment[name]"
      assert_select "input[name=?]", "equipment[description]"
      assert_select "input[name=?]", "equipment[cost]"
      assert_select "input[name=?]", "equipment[attach_to_list]"
      assert_select "input[name=?]", "equipment[attach_to_unit]"
      assert_select "input[name=?]", "equipment[game_system_id]"
    end
  end
end
