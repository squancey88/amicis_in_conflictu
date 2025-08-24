require "rails_helper"

RSpec.describe "organisations/show", type: :view do
  let(:world) { create(:world) }
  let(:organisation) { create(:organisation) }
  before(:each) do
    assign(:world, world)
    assign(:organisation, organisation)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(organisation.name)
  end
end
