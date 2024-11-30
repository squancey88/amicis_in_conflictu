require "rails_helper"

RSpec.describe "unit_traits/index", type: :view do
  let!(:unit_traits) { create_list(:unit_trait, 2, name: "Name") }
  before(:each) do
    pagy, unit_traits_data = pagy(UnitTrait.all)
    assign(:unit_traits, unit_traits_data)
    assign(:pagy, pagy)
  end

  it "renders a list of unit_traits" do
    render
    cell_selector = "div>h5"
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
  end
end
