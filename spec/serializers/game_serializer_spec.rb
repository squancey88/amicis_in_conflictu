require "rails_helper"

RSpec.describe GameSerializer do
  let(:game) { create(:game) }

  it "serializes world attributes" do
    result = described_class.new(game).serialize

    expect(result[:id]).to eq(game.id)
    expect(result[:game_state]).to eq(game.game_state)
    expect(result[:finish_reason]).to eq(game.finish_reason)
  end
end
