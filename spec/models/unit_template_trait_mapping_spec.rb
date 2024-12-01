require "rails_helper"

RSpec.describe UnitTemplateTraitMapping, type: :model do
  context "associations" do
    it { should belong_to(:unit_template) }
    it { should belong_to(:unit_trait) }
  end
end
