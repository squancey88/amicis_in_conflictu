require "rails_helper"

RSpec.describe "army_lists/new", type: :view do
  let(:army) { create(:army) }

  before(:each) do
    assign(:army, army)
    assign(:army_list, ArmyList.new(
      army:
    ))
  end

  it "renders new army_list form" do
    render

    assert_select "form[action=?][method=?]", army_army_lists_path(army), "post" do
      assert_select "input[name=?]", "army_list[name]"

      assert_select "input[name=?]", "army_list[army_id]"

      assert_select "input[name=?]", "army_list[cost]"
    end
  end
end
