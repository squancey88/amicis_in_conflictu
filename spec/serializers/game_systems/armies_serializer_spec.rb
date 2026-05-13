require "rails_helper"

RSpec.describe GameSystems::ArmiesSerializer do
  let(:army) { create(:army) }

  let(:result) { JSON.parse(described_class.new(army).serialize) }

  it "serializes army attributes" do
    expect(result["id"]).to eq(army.id)
    expect(result["name"]).to eq(army.name)
    expect(Time.zone.parse(result["created_at"])).to be_within(1.second).of(army.created_at)
    expect(Time.zone.parse(result["updated_at"])).to be_within(1.second).of(army.updated_at)
  end
end
