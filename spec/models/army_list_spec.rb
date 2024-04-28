require "rails_helper"

RSpec.describe ArmyList, type: :model do
  context "attributes" do
    it "should require army" do
      army_list = ArmyList.new(name: "test")
      expect(army_list.save).to be false
    end
  end
end
