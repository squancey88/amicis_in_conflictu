require "rails_helper"

RSpec.describe "unit_templates/index", type: :view do
  let(:game_system) { create(:wargame) }
  before(:each) do
    assign(:game_system, game_system)
    assign(:unit_templates, create_list(:unit_template, 2, name: "Name", cost: 2))
    render
  end

  it "renders a list of unit_templates" do
    expect(rendered).to have_css(".card", count: 2)
  end
end
