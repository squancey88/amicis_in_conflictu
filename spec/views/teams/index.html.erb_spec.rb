require "rails_helper"

RSpec.describe "teams/index", type: :view do
  let(:gaming_group) { create(:gaming_group) }
  before(:each) do
    assign(:gaming_group, gaming_group)
    assign(:teams, create_list(:team, 2, gaming_group:))
  end

  it "renders a list of teams" do
    render
  end
end
