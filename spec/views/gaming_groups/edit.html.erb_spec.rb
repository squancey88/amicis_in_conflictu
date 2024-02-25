require "rails_helper"

RSpec.describe "gaming_groups/edit", type: :view do
  let(:gaming_group) {
    GamingGroup.create!(
      name: "MyString"
    )
  }

  before(:each) do
    assign(:gaming_group, gaming_group)
  end

  it "renders the edit gaming_group form" do
    render

    assert_select "form[action=?][method=?]", gaming_group_path(gaming_group), "post" do
      assert_select "input[name=?]", "gaming_group[name]"
    end
  end
end
