require "rails_helper"

RSpec.describe Game, type: :model do
  let(:game_system) { create(:game_system) }
  let(:gaming_group) { create(:gaming_group) }

  it "should require a gaming_system" do
    game = Game.new(gaming_group:)
    expect(game.save).to be false
  end

  it "should require a gaming_group" do
    game = Game.new(game_system:)
    expect(game.save).to be false
  end
end
