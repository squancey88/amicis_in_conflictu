require "rails_helper"

RSpec.describe "unit_templates/index", type: :view do
  before(:each) do
    assign(:unit_templates, create_list(:unit_template, 2, name: "Name", cost: 2))
  end

  it "renders a list of unit_templates" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
