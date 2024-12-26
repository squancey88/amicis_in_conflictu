require "rails_helper"

RSpec.describe "time_periods/index", type: :view do
  before(:each) do
    assign(:time_periods, create_list(:time_period, 2))
  end

  it "renders a list of time_periods" do
    render
    expect(rendered).to have_css(".card", count: 3)
  end
end
