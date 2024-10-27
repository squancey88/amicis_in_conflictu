require "rails_helper"

RSpec.describe "teams/edit", type: :view do
  let(:gaming_group) { create(:gaming_group) }
  let(:team) {
    create(:team, gaming_group:)
  }

  before(:each) do
    assign(:gaming_group, gaming_group)
    assign(:team, team)
  end

  it "renders the edit team form" do
    render

    assert_select "form[action=?][method=?]", gaming_group_team_path(gaming_group, team), "post" do
    end
  end
end
