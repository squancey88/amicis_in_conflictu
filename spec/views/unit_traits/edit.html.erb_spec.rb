require "rails_helper"

RSpec.describe "unit_traits/edit", type: :view do
  let(:unit_trait) { create(:unit_trait) }

  before(:each) do
    assign(:unit_trait, unit_trait)
  end

  it "renders the edit unit_trait form" do
    render

    assert_select "form[action=?][method=?]", unit_trait_path(unit_trait), "post" do
      assert_select "input[name=?]", "unit_trait[name]"
      assert_select "input[name=?]", "unit_trait[game_system_id]"
      assert_select "input[name=?]", "unit_trait[active]"
    end
  end
end
