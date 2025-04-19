require "rails_helper"

RSpec.describe("Show Game", type: :system) do
  let(:game_system) { create(:wargame, name: "Game Test") }
  let(:user) { create(:user) }
  let(:opponent) { create(:user) }

  before do
    allow_any_instance_of(AuthHelper).to receive(:current_user).and_return(user)
  end

  context "with campaign and army_list" do
    let(:game_system) { create(:wargame, :turn_based_with_campaign, name: "Game Test") }
    let(:campaign) { create(:campaign, game_system:) }
    let(:army_list) { create(:army_list, user:, game_system:, campaign:) }
    let(:game) {
      create(:game, game_system:, campaign:,
        user_list: [user, opponent], army_list: [army_list, nil])
    }

    before do
      visit game_path(game)
    end

    it "should render title containing game title" do
      expect(page).to have_css(".card-title", text: game.title)
    end

    it "should show selected list row" do
      click_on "Your Army"
      expect(page).to have_css("select[name*='army_list_id']")
    end

    it "clicking on Add Army should add extra row" do
      click_on "Your Army"
      expect(page).to have_css("select[name*='army_list_id']")
      click_on "Add Army"
      expect(page).to have_css("select[name*='army_list_id']", count: 2)
    end

    it "when clicking on Add XP Gain should show form row" do
      click_on "Add XP Gain"
      expect(page).to have_css("select[name*='unit_xp_gain_event_id']")
    end

    it "when clicking on Add XP Gain should show form row" do
      click_on "Add Modifier"
      expect(page).to have_css("select[name*='unit_id']")
    end
  end
end
