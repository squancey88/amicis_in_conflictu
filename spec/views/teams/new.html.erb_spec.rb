require "rails_helper"

RSpec.describe "teams/new", type: :view do
  let(:gaming_group) { create(:gaming_group) }
  before(:each) do
    assign(:gaming_group, gaming_group)
    assign(:team, Team.new)
  end

  it "renders new team form" do
    render

    assert_select "form[action=?][method=?]", gaming_group_teams_path(gaming_group), "post" do
      assert_select "input[name=?]", "team[name]"
    end
  end
end
