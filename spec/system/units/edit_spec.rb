require "rails_helper"

RSpec.describe("Edit Unit", type: :system) do
  let(:game_system) { create(:wargame) }
  let!(:unit_trait) { create(:unit_trait, game_system:) }
  let!(:unit_trait_category) { create(:unit_trait_category, game_system:) }
  let(:army_list) { create(:army_list, game_system:) }
  let(:user) { create(:user) }
  let!(:unit) { create(:unit, army_list:) }

  before do
    allow_any_instance_of(AuthHelper).to receive(:current_user).and_return(user)
    visit edit_army_list_unit_path(army_list, unit)
  end

  it "should have name input" do
    expect(page).to have_css("input[name*='name']")
  end

  it "clicking Add Trait should add form row" do
    click_on "Add Trait"
    expect(page).to have_css("select[name*='unit_trait_id']")
  end

  it "clicking Add Category should add form row" do
    click_on "Add Category"
    expect(page).to have_css("select[name*='unit_trait_category_id']")
  end

  it "clicking Add Modifier should add form row" do
    click_on "Add Modifier"
    expect(page).to have_css("select[name*='unit_stat_modifier_id']")
  end
end
