require "rails_helper"

RSpec.describe "unit_traits/new", type: :view do
  before(:each) do
    assign(:unit_trait, create(:unit_trait))
  end

  it "renders new unit_trait form" do
    render

    assert_select "input[name=?]", "unit_trait[name]"
    assert_select "input[name=?]", "unit_trait[description]"
    assert_select "input[name=?]", "unit_trait[game_system_id]"
    assert_select "input[name=?]", "unit_trait[active]"
  end
end
