require "rails_helper"

RSpec.describe Unit, type: :model do
  let(:game_system) { create(:wargame, :turn_based) }
  let(:unit_stat_defintions) { create_list(:unit_stat_definition, 2, game_system:) }
  let(:army_list) { create(:army_list, game_system:) }
  let(:unit) {
    unit = create(:unit, army_list:)
    unit_stat_defintions.each do |definition|
      create(:unit_stat, unit_stat_definition: definition, unit:)
    end
    unit
  }

  context "associations" do
    it { should belong_to(:army_list) }
    it { should have_many(:unit_stats) }
  end

  context "validations" do
    it { should validate_presence_of(:name) }
  end

  context "cost" do
    let(:army_list) { create(:army_list, starting_cost: 50) }

    it "cannot create unit if not enough cost in list" do
      expect {
        create(:unit, army_list:, cost: 55)
      }.to raise_exception(ActiveRecord::RecordNotSaved)
    end
  end

  context "clone_from" do
    before do
      @new_unit = Unit.new_with_stats(army_list)
      @new_unit.clone_from(unit.id)
    end

    it "should have the same cost" do
      expect(@new_unit.cost).to eq unit.cost
    end
  end
end
