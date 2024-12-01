require "rails_helper"

RSpec.describe "units/edit", type: :view do
  let(:army_list) { create(:army_list) }
  let(:unit) { create(:unit, army_list:) }
  before(:each) do
    assign(:army_list, army_list)
    assign(:unit, unit)
  end

  it "renders the edit unit form" do
    render

    assert_select "form[action=?][method=?]", army_list_unit_path(army_list, unit), "post" do
      assert_select "input[name=?]", "unit[name]"

      assert_select "input[name=?]", "unit[description]"

      assert_select "input[name=?]", "unit[cost]"
    end
  end
end
