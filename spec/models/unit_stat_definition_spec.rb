require "rails_helper"

RSpec.describe UnitStatDefinition, type: :model do
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:label) }
  end

  it "stat_type_name should return correctly" do
    expect(create(:unit_stat_definition, stat_type: :standard_stat).stat_type_name).to eq "Standard"
    expect(create(:unit_stat_definition, stat_type: :save_stat).stat_type_name).to eq "Save"
    expect(create(:unit_stat_definition, stat_type: :distance_stat).stat_type_name).to eq "Distance"
  end
end
