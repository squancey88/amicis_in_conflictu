require "rails_helper"

RSpec.describe Player, type: :model do
  let(:user) { create(:user) }
  let(:game) { create(:game) }

  it "requires controller" do
    player = Player.new(game:)
    expect(player.save).to be false
  end

  it "requires game" do
    player = Player.new(controller: user)
    expect(player.save).to be false
  end
end
