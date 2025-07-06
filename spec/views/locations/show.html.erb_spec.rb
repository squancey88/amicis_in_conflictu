require "rails_helper"

RSpec.describe "locations/show", type: :view do
  let(:world) { create(:world) }
  let(:parent) { create(:location, world:) }
  let(:location) { create(:location, world:, located_in: parent) }
  let!(:child) { create(:location, world:, located_in: location) }

  before(:each) do
    assign(:location, location)
    assign(:world, world)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(location.name)
  end
end
