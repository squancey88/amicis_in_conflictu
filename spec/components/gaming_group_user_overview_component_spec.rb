require "rails_helper"

RSpec.describe GamingGroupUserOverviewComponent, type: :component do
  let(:gaming_group) { create(:gaming_group) }
  let(:owner) {
    user = create(:user)
    create(:user_group_membership, user:, gaming_group:, owner: true)
    user
  }
  let(:member) {
    user = create(:user)
    create(:user_group_membership, user:, gaming_group:, owner: false)
    user
  }
  before do
    member
    owner
  end

  context "with owner" do
    before do
      render_inline(described_class.new(gaming_group:, current_user: owner))
    end

    it "should render a card" do
      expect(page).to have_css(".card")
    end

    it "should render two list groups" do
      expect(page).to have_css(".list-group", count: 2)
    end

    it "should render menu" do
      expect(page).to have_css(".record-show-wrapper_header-menu")
    end

    it "should render invite menu" do
      expect(page).to have_css(".btn", text: /Invite User/)
    end
  end

  context "with member" do
    before do
      render_inline(described_class.new(gaming_group:, current_user: member))
    end

    it "should render a card" do
      expect(page).to have_css(".card")
    end

    it "should render two list groups" do
      expect(page).to have_css(".list-group", count: 2)
    end

    it "should not render menu" do
      expect(page).not_to have_css(".record-show-wrapper_header-menu")
    end

    it "should not render invite menu" do
      expect(page).not_to have_css(".btn", text: /Invite User/)
    end
  end
end
