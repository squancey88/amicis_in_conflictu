require "rails_helper"

RSpec.describe "campaigns/new", type: :view do
  let(:gaming_group) { create(:gaming_group) }
  before(:each) do
    assign(:gaming_group, gaming_group)
    assign(:campaign, Campaign.new)
  end

  it "renders new campaign form" do
    render

    assert_select "form[action=?][method=?]", gaming_group_campaigns_path(gaming_group), "post" do
      assert_select "input[name=?]", "campaign[name]"
    end
  end
end