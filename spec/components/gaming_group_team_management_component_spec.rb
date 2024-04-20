require "rails_helper"

RSpec.describe GamingGroupTeamManagementComponent, type: :component do
  let(:gaming_group) { create(:gaming_group) }
  let(:user) { create(:user, gaming_groups: [gaming_group]) }
  let(:other_users) { create_list(:user, 2, gaming_groups: [gaming_group]) }
  let(:team) { create(:team, users: other_users, gaming_group:) }
  let(:team_2) { create(:team, users: [other_users[0], user], gaming_group:) }

  before do
    team
    team_2
    render_inline(described_class.new(gaming_group:, current_user: user))
  end

  it "should render new team button" do
    expect(page).to have_css(".btn", text: "New Team")
  end

  it "should render card for teams" do
    expect(page).to have_css(".card", count: 2)
  end

  it "should render the team name" do
    expect(page).to have_css(".card-header", text: team.display_name)
    expect(page).to have_css(".card-header", text: team_2.display_name)
  end
end
