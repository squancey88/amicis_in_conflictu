require "rails_helper"

RSpec.describe "locations/index", type: :view do
  let(:world) { create(:world) }
  let!(:locations) { create_list(:location, 2, world:) }

  before(:each) do
    pagy, records = pagy(world.locations)
    assign(:world, world)
    assign(:pagy, pagy)
    assign(:locations, records)
  end

  it "renders a list of locations" do
    render
    expect(rendered).to have_css(".list-group-item", text: locations[0].name)
    expect(rendered).to have_css(".list-group-item", text: locations[1].name)
  end
end
