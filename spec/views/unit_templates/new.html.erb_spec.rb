require "rails_helper"

RSpec.describe "unit_templates/new", type: :view do
  let(:game_system) { create(:wargame) }
  before(:each) do
    assign(:game_system, game_system)
    assign(:unit_template, create(:unit_template, game_system:))
  end

  it "renders new unit_template form" do
    render
    assert_select "input[name=?]", "unit_template[name]"
    assert_select "input[name=?]", "unit_template[cost]"
  end
end
