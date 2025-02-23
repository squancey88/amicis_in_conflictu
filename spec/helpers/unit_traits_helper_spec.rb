require "rails_helper"

RSpec.describe UnitTraitsHelper, type: :helper do
  let(:game_system) { create(:wargame) }
  let(:unit_trait) { create(:unit_trait, game_system:, name: "Trait Test") }
  let(:army_list) { create(:army_list, game_system:) }
  let(:unit) {
    unit = create(:unit, army_list:)
    create(:unit_trait_mapping, unit:, unit_trait:)
    unit
  }

  it "should render bootstrap_unit_traits_select" do
    form_res = form_with url: root_url do |form|
      helper.bootstrap_unit_traits_select(game_system, form, :unit_trait_id)
    end
    expect(form_res).to have_css("select")
  end

  it "should return list of traits" do
    response = helper.traits_list(unit)
    expect(response).to match(/Trait Test/)
  end
end
