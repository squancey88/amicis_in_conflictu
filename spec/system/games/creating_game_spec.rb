require "rails_helper"

RSpec.describe("Creating a Game", type: :system) do
  let!(:game_system) { create(:wargame, name: "Game Test") }
  let!(:user) { create(:user, nickname: "User") }
  let!(:opponent) { create(:user, nickname: "Opponent") }
  let!(:gaming_group) { create(:gaming_group, members: [user, opponent]) }
  let!(:gaming_session) { create(:gaming_session, gaming_group:) }

  before do
    login(user)
  end

  it "should create a game" do
    visit gaming_group_gaming_session_path(gaming_group, gaming_session)

    expect(page).to have_text("New Game")

    click_on "New Game"

    select "Game Test", from: "Game System"

    within(find(:testid, "PlayerSelector")) do
      find("select").select("User")
      find(:testid, "add-player").click

      find("select").select("Opponent")
      find(:testid, "add-player").click
    end

    expect(page).to have_button("Create Game", disabled: false)

    expect {
      click_on "Create Game"
      expect(page).to have_text("Game Status")
    }.to change(Game, :count).by(1)
  end
end
