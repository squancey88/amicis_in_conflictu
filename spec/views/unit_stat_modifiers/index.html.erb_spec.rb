require "rails_helper"

RSpec.describe "unit_stat_modifiers/index", type: :view do
  before(:each) do
    assign(:unit_stat_modifiers, create_list(:unit_stat_modifier, 2))
  end

  it "renders a list of unit_stat_modifiers" do
    render
  end
end
