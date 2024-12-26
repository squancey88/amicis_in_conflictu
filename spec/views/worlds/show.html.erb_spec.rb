require "rails_helper"

RSpec.describe "worlds/show", type: :view do
  before(:each) do
    assign(:world, create(:world))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Blurb/)
  end
end
