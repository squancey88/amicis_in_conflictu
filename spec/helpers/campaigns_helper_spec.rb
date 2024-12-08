require "rails_helper"
RSpec.describe CampaignsHelper, type: :helper do
  let(:gaming_group) { create(:gaming_group) }
  it "should render campaign select" do
    form_res = form_with model: ArmyList.new do |form|
      helper.campaign_select(form, :campaign_id, gaming_group)
    end
    expect(form_res).to have_css("select")
  end
end
