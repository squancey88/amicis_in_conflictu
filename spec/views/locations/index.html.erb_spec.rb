require "rails_helper"

RSpec.describe "locations/index", type: :view do
  let(:world) { create(:world) }
  let(:locations) { create_list(:location, 2, world:) }

  before(:each) do
    assign(:locations, locations)
    assign(:world, world)
  end

  it "renders a list of locations" do
    render
    expect(rendered).to have_text(locations[0].name)
  end
end
