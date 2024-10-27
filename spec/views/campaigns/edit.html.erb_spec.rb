require "rails_helper"

RSpec.describe "campaigns/edit", type: :view do
  let(:gaming_group) { create(:gaming_group) }
  let(:campaign) { create(:campaign, gaming_group:) }

  before(:each) do
    assign(:gaming_group, gaming_group)
    assign(:campaign, campaign)
  end

  it "renders the edit campaign form" do
    render

    assert_select "form[action=?][method=?]", gaming_group_campaign_path(gaming_group, campaign), "post" do
      assert_select "input[name=?]", "campaign[name]"
      assert_select "input[name=?]", "campaign[game_system_id]"
    end
  end
end
