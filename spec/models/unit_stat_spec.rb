require "rails_helper"

RSpec.describe UnitStat, type: :model do
  context "associations" do
    it { should belong_to(:unit) }
    it { should belong_to(:unit_stat_definition) }
  end

  context "current_value" do
    let(:unit_stat_definition) { create(:unit_stat_definition) }
    let(:no_modifiers) { create(:unit_stat, base_value: 10) }
    let(:with_modifier) {
      unit = create(:unit)
      mod = create(:unit_stat_modifier)
      create(:unit_stat_change, unit_stat_modifier: mod, unit_stat_definition:, stat_change: -1)
      create(:unit_applied_modifier, unit:, unit_stat_modifier: mod)
      create(:unit_stat, base_value: 10, unit:, unit_stat_definition:)
    }

    let(:with_modifiers) {
      unit = create(:unit)
      mod = create(:unit_stat_modifier)
      create(:unit_stat_change, unit_stat_modifier: mod, unit_stat_definition:, stat_change: -1)
      mod2 = create(:unit_stat_modifier)
      create(:unit_stat_change, unit_stat_modifier: mod2, unit_stat_definition:, stat_change: -2)
      create(:unit_applied_modifier, unit:, unit_stat_modifier: mod)
      create(:unit_applied_modifier, unit:, unit_stat_modifier: mod2)
      create(:unit_stat, base_value: 10, unit:, unit_stat_definition:)
    }

    it "should return value with no modifiers" do
      expect(no_modifiers.current_value).to eq 10
    end

    it "should return correct value with single modifier" do
      expect(with_modifier.current_value).to eq 9
    end

    it "should return correct value with modifiers" do
      expect(with_modifiers.current_value).to eq 7
    end
  end
end
