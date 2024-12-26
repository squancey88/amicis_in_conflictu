require "rails_helper"

RSpec.describe "time_periods/edit", type: :view do
  let(:time_period) { create(:time_period) }

  before(:each) do
    assign(:time_period, time_period)
  end

  it "renders the edit time_period form" do
    render

    assert_select "form[action=?][method=?]", time_period_path(time_period), "post" do
      assert_select "input[name=?]", "time_period[order]"
      assert_select "input[name=?]", "time_period[name]"
    end
  end
end
