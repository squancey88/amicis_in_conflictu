require "rails_helper"

RSpec.describe EquipmentAttachment, type: :model do
  let(:army_list) { create(:army_list, starting_cost: 50) }

  let(:equipment) { create(:equipment, cost: 45) }
  let(:equipment_expensive) { create(:equipment, cost: 55) }
  describe "associations" do
    it { should belong_to(:equipment) }
  end

  context "cost check" do
    it "cannot create when too expensive" do
      expect {
        described_class.create(attached_to: army_list, equipment: equipment_expensive)
      }.to change(described_class, :count).by(0)
    end

    it "can create when enough cost" do
      expect {
        described_class.create(attached_to: army_list, equipment:)
      }.to change(described_class, :count).by(1)
    end
  end
end
