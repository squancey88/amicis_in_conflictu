require "rails_helper"

RSpec.describe "time_periods/show", type: :view do
  let(:world) { create(:world) }
  let(:time_period) { create(:time_period, world:) }
  before(:each) do
    assign(:world, world)
    assign(:time_period, time_period)
    assign(:presenter, TimePeriodPresenter.new(double, time_period))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to have_css("p", text: /#{time_period.name}/)
  end
end
