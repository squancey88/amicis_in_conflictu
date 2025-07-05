require 'rails_helper'

RSpec.describe "location_types/edit", type: :view do
  let(:location_type) {
    LocationType.create!(
      name: "MyString",
      world: nil
    )
  }

  before(:each) do
    assign(:location_type, location_type)
  end

  it "renders the edit location_type form" do
    render

    assert_select "form[action=?][method=?]", location_type_path(location_type), "post" do

      assert_select "input[name=?]", "location_type[name]"

      assert_select "input[name=?]", "location_type[world_id]"
    end
  end
end
