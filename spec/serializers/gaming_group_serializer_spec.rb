require "rails_helper"

RSpec.describe GamingGroupSerializer do
  let(:gaming_group) { create(:gaming_group) }

  it "serializes gaming_group attributes" do
    result = described_class.new(gaming_group).serialize

    expect(result[:id]).to eq(gaming_group.id)
    expect(result[:created_at]).to eq(gaming_group.created_at.to_s)
    expect(result[:updated_at]).to eq(gaming_group.updated_at.to_s)
  end
end
