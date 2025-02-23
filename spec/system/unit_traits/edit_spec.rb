require "rails_helper"

RSpec.describe("Edit Unit Trait", type: :system) do
  let(:game_system) { create(:wargame) }
  let!(:unit_trait) { create(:unit_trait, game_system:) }
  let!(:unit_trait_category) { create(:unit_trait_category, game_system:) }
  let(:user) { create(:user) }

  before do
    allow_any_instance_of(AuthHelper).to receive(:current_user).and_return(user)
    visit edit_unit_trait_path(unit_trait)
  end

  it "should have name input" do
    expect(page).to have_css("input[name*='name']")
  end

  it "clicking Add Category should add form row" do
    click_on "Add Category"
    expect(page).to have_css("select[name*='unit_trait_category_id']")
  end
end
