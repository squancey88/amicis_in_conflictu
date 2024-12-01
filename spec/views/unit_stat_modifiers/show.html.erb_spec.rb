require "rails_helper"

RSpec.describe "unit_stat_modifiers/show", type: :view do
  before(:each) do
    assign(:unit_stat_modifier, create(:unit_stat_modifier))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/false/)
  end
end
