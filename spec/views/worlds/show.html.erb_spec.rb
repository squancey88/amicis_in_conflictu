require "rails_helper"

RSpec.describe "worlds/show", type: :view do
  let(:world) { create(:world, name: "Test") }
  let!(:articles) { create_list(:article, 3, world:) }
  let!(:characters) { create_list(:character, 3, world:) }
  let!(:locations) { create_list(:location, 3, world:) }

  before(:each) do
    assign(:world, world)
    render
  end

  it "renders attributes in <p>" do
    expect(rendered).to have_css("h1", text: "Test")
  end
end
