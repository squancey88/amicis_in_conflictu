require "rails_helper"

RSpec.describe "army_lists/new", type: :view do
  before(:each) do
    assign(:army_list, ArmyList.new(
      name: "MyString",
      details: "",
      army: nil,
      cost: 1
    ))
  end

  it "renders new army_list form" do
    render

    assert_select "form[action=?][method=?]", army_lists_path, "post" do
      assert_select "input[name=?]", "army_list[name]"

      assert_select "input[name=?]", "army_list[details]"

      assert_select "input[name=?]", "army_list[army_id]"

      assert_select "input[name=?]", "army_list[cost]"
    end
  end
end
