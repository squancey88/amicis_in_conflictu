require 'rails_helper'

RSpec.describe "locations/new", type: :view do
  before(:each) do
    assign(:location, Location.new(
      name: "MyString",
      description: "",
      history: "",
      located_in: nil,
      world: nil,
      location_type: nil
    ))
  end

  it "renders new location form" do
    render

    assert_select "form[action=?][method=?]", locations_path, "post" do

      assert_select "input[name=?]", "location[name]"

      assert_select "input[name=?]", "location[description]"

      assert_select "input[name=?]", "location[history]"

      assert_select "input[name=?]", "location[located_in_id]"

      assert_select "input[name=?]", "location[world_id]"

      assert_select "input[name=?]", "location[location_type_id]"
    end
  end
end
