require "rails_helper"

RSpec.describe UnitTraitCategoriesHelper, type: :helper do
  let(:game_system) { create(:wargame) }
  let(:unit_trait_category) { create(:unit_trait_category, name: "Test Category", game_system:) }
  let(:unit_trait) { create(:unit_trait, game_system:, name: "Trait Test") }
  let(:army_list) { create(:army_list, game_system:) }
  let!(:unit) {
    unit = create(:unit, army_list:)
    create(:unit_trait_mapping, unit:, unit_trait:)
    create(:unit_trait_category_mapping, mapped_to: unit, unit_trait_category:)
    unit
  }

  it "should return category list" do
    response = helper.unit_trait_category_list(unit)
    expect(response).to match(/Test Category/)
  end
end
