require "rails_helper"

RSpec.describe ArmyList, type: :model do
  context "associations" do
    it { should belong_to(:user) }
  end
  context "validation" do
    it "should require user" do
      army_list = ArmyList.new(name: "test")
      expect(army_list.valid?).to be false
    end
  end

  context "cost calculations" do
    let(:initial_cost) { 1000 }
    let(:game_system) { create(:wargame, :turn_based) }
    let(:campaign) { create(:campaign, game_system:, list_start_cost: 1000) }
    let(:army_list) { create(:army_list, campaign:) }

    it "should set starting_cost" do
      expect(army_list.starting_cost).to eq(initial_cost)
    end

    it "list_cost should return correct value" do
      create(:unit, cost: 50, army_list:)
      expect(army_list.list_cost).to eq(50)
    end

    it "remaining_cost should return correct value" do
      create(:unit, cost: 50, army_list:)
      expect(army_list.remaining_cost).to eq(950)
    end
  end
end
