require "rails_helper"

RSpec.describe UnitTraitCategoriesHelper, type: :helper do
  let(:game_system) { create(:wargame) }
  let!(:unit_trait_category) { create(:unit_trait_category, name: "Test Category", game_system:) }
  let(:army_list) { create(:army_list, game_system:) }
  let!(:unit) { create(:unit, army_list:) }
  let!(:mapping) { create(:unit_trait_category_mapping, mapped_to: unit, unit_trait_category:) }

  it "should return category list" do
    response = helper.unit_trait_category_list(unit)
    expect(response).to match(/Test Category/)
  end
end
