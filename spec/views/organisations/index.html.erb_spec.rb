require "rails_helper"

RSpec.describe "organisations/index", type: :view do
  let(:world) { create(:world) }
  let(:organisations) { create_list(:organisation, 2, world:) }

  before(:each) do
    assign(:world, world)
    assign(:organisations, organisations)
  end

  it "renders a list of organisations" do
    render
    expect(rendered).to have_text(organisations[0].name)
    expect(rendered).to have_text(organisations[1].name)
  end
end
