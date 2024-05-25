require "rails_helper"

RSpec.describe GameSystem, type: :model do
  let(:game_system) { create(:game_system, name: "Test") }

  context "associations" do
    it { should have_many(:games) }
  end

  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:slug) }
    it { should validate_uniqueness_of(:slug) }
  end

  context "attributes" do
    it { expect(game_system).to have_attributes(name: "Test") }
  end
end
