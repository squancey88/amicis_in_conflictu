require 'rails_helper'

RSpec.describe "locations/edit", type: :view do
  let(:location) {
    Location.create!(
      name: "MyString",
      description: "",
      history: "",
      located_in: nil,
      world: nil,
      location_type: nil
    )
  }

  before(:each) do
    assign(:location, location)
  end

  it "renders the edit location form" do
    render

    assert_select "form[action=?][method=?]", location_path(location), "post" do

      assert_select "input[name=?]", "location[name]"

      assert_select "input[name=?]", "location[description]"

      assert_select "input[name=?]", "location[history]"

      assert_select "input[name=?]", "location[located_in_id]"

      assert_select "input[name=?]", "location[world_id]"

      assert_select "input[name=?]", "location[location_type_id]"
    end
  end
end
