require "rails_helper"

RSpec.describe GameSystem, type: :model do
  let(:game_system) { create(:game_system, name: "Test") }

  context "attributes" do
    it { expect(game_system).to have_attributes(name: "Test") }
  end
end
