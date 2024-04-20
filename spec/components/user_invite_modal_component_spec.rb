require "rails_helper"

RSpec.describe UserInviteModalComponent, type: :component do
  let(:gaming_group) { create(:gaming_group) }

  before do
    render_inline(described_class.new(gaming_group:))
  end

  it "should render the invite user button" do
    expect(page).to have_css(".btn", text: "Invite User")
  end

  it "should render the modal" do
    expect(page).to have_css(".modal")
  end
end
