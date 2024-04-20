require "rails_helper"

RSpec.describe "teams/edit", type: :view do
  let(:team) {
    create(:team)
  }

  before(:each) do
    assign(:team, team)
  end

  it "renders the edit team form" do
    render

    assert_select "form[action=?][method=?]", team_path(team), "post" do
    end
  end
end
