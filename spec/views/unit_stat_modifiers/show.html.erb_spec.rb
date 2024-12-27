require "rails_helper"

RSpec.describe "unit_stat_modifiers/show", type: :view do
  let(:unit_stat_modifier) { create(:unit_stat_modifier) }
  before(:each) do
    assign(:unit_stat_modifier, unit_stat_modifier)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to have_css("p", text: /#{unit_stat_modifier.name}/)
  end
end
