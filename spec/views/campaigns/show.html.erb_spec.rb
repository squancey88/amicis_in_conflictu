require "rails_helper"

RSpec.describe "campaigns/show", type: :view do
  let(:gaming_group) { create(:gaming_group) }
  let(:campaign) { create(:campaign, gaming_group:) }
  before(:each) do
    assign(:gaming_group, gaming_group)
    assign(:campaign, campaign)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{campaign.name}/)
  end
end
