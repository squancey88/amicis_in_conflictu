require "rails_helper"

RSpec.describe GameSystems::UnitStatModifierSerializer do
  let(:unit_stat_modifier) { create(:unit_stat_modifier) }

  let(:result) { JSON.parse(described_class.new(unit_stat_modifier).serialize) }

  it "serializes unit_stat_modifier attributes" do
    expect(result["id"]).to eq(unit_stat_modifier.id)
    expect(result["name"]).to eq(unit_stat_modifier.name)
    expect(Time.zone.parse(result["created_at"])).to be_within(1.second).of(unit_stat_modifier.created_at)
    expect(Time.zone.parse(result["updated_at"])).to be_within(1.second).of(unit_stat_modifier.updated_at)
  end
end
