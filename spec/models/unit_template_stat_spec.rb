require "rails_helper"

RSpec.describe UnitTemplateStat, type: :model do
  context "associations" do
    it { should belong_to(:unit_template) }
    it { should belong_to(:unit_stat_definition) }
  end
end
