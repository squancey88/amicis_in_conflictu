require "rails_helper"

RSpec.describe "worlds/show", type: :view do
  before(:each) do
    assign(:world, create(:world, name: "Test"))
    render
  end

  it "renders attributes in <p>" do
    expect(rendered).to have_css("h1", text: "Test")
  end
end
