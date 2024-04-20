require "rails_helper"

RSpec.describe "teams/index", type: :view do
  before(:each) do
    assign(:teams, create_list(:team, 2))
  end

  it "renders a list of teams" do
    render
  end
end
