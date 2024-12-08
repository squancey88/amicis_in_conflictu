require "rails_helper"

RSpec.describe UnitTemplate, type: :model do
  let(:game_system) { create(:wargame) }
  let(:army) { create(:army, game_system:) }
  let(:army_list) { create(:army_list, game_system:, army:) }
  let(:unit_trait) { create(:unit_trait, game_system:) }
  let(:definitions) { create_list(:unit_stat_definition, 2, game_system:) }
  let(:unit_template) {
    template = create(:unit_template, cost: 50, game_system:, army:)
    definitions.each_with_index do |d, i|
      create(:unit_template_stat, unit_template: template, unit_stat_definition: d, base_value: (i + 1))
    end
    create(:unit_template_trait_mapping, unit_trait:, unit_template: template)
    template
  }

  context "associations" do
    it { should belong_to(:game_system) }
    it { should have_many(:unit_traits) }
  end

  context "to unit" do
    before do
      @unit = unit_template.to_unit(army_list)
      @unit.name = "Test"
      @unit.save!
    end

    it "should have correct cost" do
      expect(@unit.cost).to eq 50
    end

    context "unit traits" do
      it "should have correct number of traits" do
        expect(@unit.unit_traits.count).to eq 1
      end

      it "should have correct trait" do
        expect(@unit.unit_traits.first).to eq unit_trait
      end
    end

    context "unit stats" do
      it "should have correct number of stats" do
        expect(@unit.unit_stats.count).to eq 2
      end

      it "should setup first stat correctly" do
        stat = @unit.unit_stats.where(unit_stat_definition: definitions[0]).first
        expect(stat.base_value).to eq 1
      end

      it "should setup second stat correctly" do
        stat = @unit.unit_stats.where(unit_stat_definition: definitions[1]).first
        expect(stat.base_value).to eq 2
      end
    end
  end
end
