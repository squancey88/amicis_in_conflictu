require "rails_helper"

RSpec.describe UnitTrait, type: :model do
  context "associations" do
    it { should belong_to(:game_system) }
    it { should have_many(:unit_trait_mappings) }
  end

  context "validations" do
    it { should validate_presence_of(:name) }
  end
end
