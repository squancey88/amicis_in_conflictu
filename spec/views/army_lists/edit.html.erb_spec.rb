require "rails_helper"

RSpec.describe "army_lists/edit", type: :view do
  let(:army_list) { create(:army_list) }

  before(:each) do
    assign(:army_list, army_list)
  end

  it "renders the edit army_list form" do
    render

    assert_select "form[action=?][method=?]", army_list_path(army_list), "post" do
      assert_select "input[name=?]", "army_list[name]"

      assert_select "input[name=?]", "army_list[details]"

      assert_select "input[name=?]", "army_list[army_id]"

      assert_select "input[name=?]", "army_list[cost]"
    end
  end
end
