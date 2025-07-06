require "rails_helper"

RSpec.describe "locations/new", type: :view do
  let(:world) { create(:world) }
  let(:location) { Location.new(world:) }
  before(:each) do
    assign(:location, location)
    assign(:world, world)
  end

  it "renders new location form" do
    render

    assert_select "form[action=?][method=?]", world_locations_path(world), "post" do
      assert_select "input[name=?]", "location[name]"
    end
  end
end
