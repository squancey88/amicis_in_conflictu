require "rails_helper"

RSpec.describe "organisations/index", type: :view do
  let(:world) { create(:world) }
  let!(:organisations) { create_list(:organisation, 2, world:) }

  before(:each) do
    pagy, records = pagy(world.organisations)
    assign(:world, world)
    assign(:pagy, pagy)
    assign(:organisations, records)
  end

  it "renders a list of organisations" do
    render
    expect(rendered).to have_css(".list-group-item", text: organisations[0].name)
    expect(rendered).to have_css(".list-group-item", text: organisations[1].name)
  end
end
