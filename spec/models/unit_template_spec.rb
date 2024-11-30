require "rails_helper"

RSpec.describe UnitTemplate, type: :model do
  context "associations" do
    it { should belong_to(:game_system) }
    it { should have_many(:unit_traits) }
  end
end
