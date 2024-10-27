# frozen_string_literal: true

require "rails_helper"

RSpec.describe CampaignListComponent, type: :component do
  let(:gaming_group) { create(:gaming_group) }
  let!(:campaign) { create(:campaign, gaming_group:) }

  before do
    render_inline(described_class.new(gaming_group:))
  end

  it "should render link to campaign" do
    expect(page).to have_link(campaign.name, href: /#{campaign.id}/)
  end
end
