require "rails_helper"

RSpec.describe WorldSerializer do
  let(:world) { create(:world) }

  it "serializes world attributes" do
    result = described_class.new(world).serialize

    expect(result[:id]).to eq(world.id)
    expect(result[:name]).to eq(world.name)
  end

  it "respects only option" do
    result = described_class.new(world, only: [:name], exclude_timestamps: true).serialize

    expect(result.keys).to contain_exactly(:id, :name)
  end
end
