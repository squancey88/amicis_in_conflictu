require "rails_helper"

RSpec.describe UnitTraitMapping, type: :model do
  context "associations" do
    it { should belong_to(:unit_trait) }
    it { should belong_to(:unit) }
  end
end
