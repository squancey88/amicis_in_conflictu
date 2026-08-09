require "rails_helper"

RSpec.describe GameObjective, type: :model do
  subject { create(:game_objective) }

  context "associations" do
    it { should belong_to(:game_system) }
  end

  context "validation" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:scoring_key) }
    it { should validate_uniqueness_of(:name).scoped_to(:game_system_id) }
  end
end
