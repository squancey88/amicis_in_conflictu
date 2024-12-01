require "rails_helper"

RSpec.describe UnitStatChange, type: :model do
  context "associations" do
    it { should belong_to(:unit_stat_definition) }
    it { should belong_to(:unit_stat_modifier) }
  end

  context "validations" do
    it { should validate_presence_of(:stat_change) }
  end
end
