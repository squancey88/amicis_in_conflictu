require "rails_helper"

RSpec.describe "equipment/new", type: :view do
  before(:each) do
    assign(:equipment, Equipment.new(
      name: "MyString",
      description: "MyString",
      cost: 1,
      attach_to_list: false,
      attach_to_unit: false,
      game_system: nil
    ))
  end

  it "renders new equipment form" do
    render

    assert_select "form[action=?][method=?]", equipment_index_path, "post" do
      assert_select "input[name=?]", "equipment[name]"

      assert_select "input[name=?]", "equipment[description]"

      assert_select "input[name=?]", "equipment[cost]"

      assert_select "input[name=?]", "equipment[attach_to_list]"

      assert_select "input[name=?]", "equipment[attach_to_unit]"

      assert_select "input[name=?]", "equipment[game_system_id]"
    end
  end
end
