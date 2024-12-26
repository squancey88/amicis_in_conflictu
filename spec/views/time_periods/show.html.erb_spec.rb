require "rails_helper"

RSpec.describe "time_periods/show", type: :view do
  let(:time_period) { create(:time_period) }
  before(:each) do
    assign(:time_period, time_period)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to have_css("p", text: /#{time_period.name}/)
  end
end
