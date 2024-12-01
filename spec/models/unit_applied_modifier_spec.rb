require "rails_helper"

RSpec.describe UnitAppliedModifier, type: :model do
  context "associations" do
    it { should belong_to(:unit) }
    it { should belong_to(:game) }
    it { should belong_to(:unit_stat_modifier) }
  end
end
