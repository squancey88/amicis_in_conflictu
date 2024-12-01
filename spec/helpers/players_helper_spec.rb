require "rails_helper"

RSpec.describe PlayersHelper, type: :helper do
  let(:player) { create(:player, :with_user, :with_game) }
  let(:army) { create(:army, name: "Test Army") }
  let(:list) { create(:army_list, name: "Test List", army:) }
  let(:player_armies_no_list) { create(:player_army, army:, player:) }
  let(:player_armies_with_list) { create(:player_army, army:, army_list: list, player:) }

  describe "army_list_str" do
    before do
      player_armies_no_list
      player_armies_with_list
    end
    it "should join lists with &amp;" do
      expect(army_list_str(player)).to include("&amp;")
    end
  end

  describe "army_name" do
    it "should return only army name when no list" do
      expect(army_name(player_armies_no_list)).to eq(army.name)
    end

    it "should return army name and list with list" do
      expect(army_name(player_armies_with_list)).to eq("#{army.name} (#{list.name})")
    end
  end

  describe "winner_badge" do
    let(:player) { create(:player, :with_user, :with_game) }
    it "should have the correct classes" do
      expect(winner_badge(player)).to include("badge")
    end
  end
end
