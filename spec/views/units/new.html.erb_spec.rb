require "rails_helper"

RSpec.describe "units/new", type: :view do
  let(:army_list) { create(:army_list) }
  before(:each) do
    assign(:army_list, army_list)
    assign(:unit, Unit.new(army_list:))
  end

  it "renders new unit form" do
    render

    assert_select "form[action=?][method=?]", army_list_units_path(army_list), "post" do
      assert_select "input[name=?]", "unit[name]"

      assert_select "input[name=?]", "unit[description]"

      assert_select "input[name=?]", "unit[cost]"
    end
  end
end
