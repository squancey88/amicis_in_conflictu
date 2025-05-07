require "rails_helper"

RSpec.describe "campaigns/index", type: :view do
  let(:gaming_group) { create(:gaming_group) }
  before(:each) do
    assign(:gaming_group, gaming_group)
    assign(:campaigns, create_list(:campaign, 2, name: "Campaign Test", gaming_group:))
  end

  it "renders a list of campaigns" do
    render
    expect(rendered).to have_text("Campaign Test", count: 2)
  end
end
