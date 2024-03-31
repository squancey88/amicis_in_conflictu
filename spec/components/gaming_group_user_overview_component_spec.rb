# frozen_string_literal: true

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
    render_inline(described_class.new(gaming_group:))
  end

  it "should render a card" do
    expect(page).to have_css(".card")
  end

  it "should render two list groups" do
    expect(page).to have_css(".list-group", count: 2)
  end
end
