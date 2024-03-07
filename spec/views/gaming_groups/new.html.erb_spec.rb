require "rails_helper"

RSpec.describe "gaming_groups/new", type: :view do
  before(:each) do
    assign(:gaming_group, GamingGroup.new(
      name: "MyString"
    ))
  end

  it "renders new gaming_group form" do
    render

    assert_select "form[action=?][method=?]", gaming_groups_path, "post" do
      assert_select "input[name=?]", "gaming_group[name]"
    end
  end
end
