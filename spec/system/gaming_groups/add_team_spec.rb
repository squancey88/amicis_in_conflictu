require "rails_helper"

RSpec.describe("Gaming group add team", type: :system) do
  let(:gaming_group) { create(:gaming_group) }

  let(:user) { create(:user) }
  let!(:user_group_membership) { create(:user_group_membership, gaming_group:, user:) }

  let(:other) { create(:user) }
  let!(:other_group_membership) { create(:user_group_membership, gaming_group:, user: other) }

  before do
    allow_any_instance_of(AuthHelper).to receive(:current_user).and_return(user)
  end

  it "should create new team" do
    visit gaming_group_path(gaming_group)
    click_on "Members & Teams"
    click_on "New Team"

    fill_in "Name", with: "Test name"
    select user.display_name, from: "Members"
    select other.display_name, from: "Members"

    expect {
      click_on "Save"
      sleep(0.2)
    }.to change(gaming_group.teams, :count).by(1)

    team = gaming_group.teams.first
    expect(team.users).to contain_exactly(user, other)

    expect(page).to have_current_path(gaming_group_path(gaming_group))
  end
end
