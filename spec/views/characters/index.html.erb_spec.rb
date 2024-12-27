require "rails_helper"

RSpec.describe "characters/index", type: :view do
  before(:each) do
    assign(:characters, create_list(:character, 2))
  end

  it "renders a list of characters" do
    render
    expect(rendered).to have_css(".card", count: 3)
  end
end
