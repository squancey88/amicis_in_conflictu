require "rails_helper"

RSpec.describe ArmyList, type: :model do
  context "associations" do
    it { should belong_to(:army) }
  end
  context "validation" do
    it "should require army" do
      army_list = ArmyList.new(name: "test")
      expect(army_list.valid?).to be false
    end
  end
end
