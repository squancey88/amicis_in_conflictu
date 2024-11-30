require "rails_helper"

RSpec.describe "units/index", type: :view do
  let(:army_list) { create(:army_list) }
  before(:each) do
    assign(:army_list, army_list)
    assign(:units, create_list(:unit, 2, army_list:))
  end

  it "renders a list of units" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Description".to_s), count: 2
  end
end
