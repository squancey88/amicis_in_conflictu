require "rails_helper"

RSpec.describe UnitStatModifiersHelper, type: :helper do
  let(:game_system) { create(:wargame) }
  it "should return unit_stat_definition_select" do
    form_res = form_with model: UnitStatModifier.new do |form|
      form.fields_for :unit_stat_changes, UnitStatChange.new, child_index: Time.now.to_i do |ff|
        helper.bootstrap_unit_stat_definition_select(game_system, ff, :unit_stat_definition_id)
      end
    end
    expect(form_res).to have_css("select")
  end

  it "should return unit_stat_defintion_type_select" do
    form_res = form_with model: GameSystems::Wargame.new do |f|
      f.fields_for :unit_stat_definitions, UnitStatDefinition.new, child_index: Time.now.to_i do |ff|
        helper.unit_stat_definition_type_select(ff)
      end
    end
    expect(form_res).to have_css("select")
  end
end
