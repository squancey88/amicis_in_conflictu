require "rails_helper"

RSpec.describe "unit_xp_gain_events/show", type: :view do
  let(:unit_xp_gain_event) { create(:unit_xp_gain_event, name: "Test") }
  before(:each) do
    assign(:unit_xp_gain_event, unit_xp_gain_event)
    assign(:presenter, UnitXpGainEventPresenter.new(double, unit_xp_gain_event))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Test/)
  end
end
