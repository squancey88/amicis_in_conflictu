require "rails_helper"

RSpec.describe "locations/edit", type: :view do
  let(:world) { create(:world) }
  let(:location) { create(:location, world:) }

  before(:each) do
    assign(:location, location)
    assign(:world, world)
  end

  it "renders the edit location form" do
    render

    assert_select "form[action=?][method=?]", world_location_path(world, location), "post" do
      assert_select "input[name=?]", "location[name]"
    end
  end
end
