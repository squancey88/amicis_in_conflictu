require "rails_helper"

RSpec.describe "worlds/index", type: :view do
  before(:each) do
    assign(:worlds, create_list(:world, 2))
  end

  it "renders a list of worlds" do
    render
    expect(rendered).to have_css(".card", count: 3)
  end
end
