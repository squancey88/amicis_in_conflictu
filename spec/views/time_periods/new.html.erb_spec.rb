require "rails_helper"

RSpec.describe "time_periods/new", type: :view do
  let(:world) { create(:world) }
  before(:each) do
    assign(:time_period, TimePeriod.new(
      order: 1,
      world:,
      name: "MyString",
      description: ""
    ))
    assign(:world, world)
  end

  it "renders new time_period form" do
    render

    assert_select "form[action=?][method=?]", world_time_periods_path(world), "post" do
      assert_select "input[name=?]", "time_period[order]"

      assert_select "input[name=?]", "time_period[world_id]"

      assert_select "input[name=?]", "time_period[name]"

      assert_select "input[name=?]", "time_period[description]"
    end
  end
end
