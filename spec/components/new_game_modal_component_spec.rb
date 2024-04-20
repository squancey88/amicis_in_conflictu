require "rails_helper"

RSpec.describe NewGameModalComponent, type: :component do
  let(:gaming_group) { create(:gaming_group) }
  let(:users) { create_list(:user, 3, gaming_groups: [gaming_group]) }
  let(:team) { create(:team, users: users[0..1], gaming_group:) }
  let(:gaming_session) { create(:gaming_session, gaming_group:) }

  before do
    users
    team
    render_inline(described_class.new(gaming_session:))
  end

  it "should have a New Game button" do
    expect(page).to have_css(".btn", text: "New Game")
  end

  it "should render a modal" do
    expect(page).to have_css(".modal")
  end
end
