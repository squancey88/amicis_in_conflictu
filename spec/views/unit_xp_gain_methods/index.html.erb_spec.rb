require "rails_helper"

RSpec.describe "unit_xp_gain_events/index", type: :view do
  before(:each) do
    assign(:unit_xp_gain_events, create_list(:unit_xp_gain_event, 2))
  end

  it "renders a list of unit_xp_gain_events" do
    render
    expect(rendered).to have_css(".card", count: 3)
  end
end
