require "rails_helper"

RSpec.describe GameSystemSerializer do
  let(:game_system) { create(:wargame) }

  it "serializes world attributes" do
    result = described_class.new(game_system).serialize

    expect(result[:id]).to eq(game_system.id)
    expect(result[:name]).to eq(game_system.name)
  end
end
