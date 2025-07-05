require 'rails_helper'

RSpec.describe "location_types/new", type: :view do
  before(:each) do
    assign(:location_type, LocationType.new(
      name: "MyString",
      world: nil
    ))
  end

  it "renders new location_type form" do
    render

    assert_select "form[action=?][method=?]", location_types_path, "post" do

      assert_select "input[name=?]", "location_type[name]"

      assert_select "input[name=?]", "location_type[world_id]"
    end
  end
end
