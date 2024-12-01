require "rails_helper"

RSpec.describe "equipment/index", type: :view do
  let!(:equipment) { create_list(:equipment, 2, name: "Test") }
  before(:each) do
    pagy, equipment_data = pagy(Equipment.all)
    assign(:equipment, equipment_data)
    assign(:pagy, pagy)
  end
  it "renders a list of equipment" do
    render
    cell_selector = "div>h5"
    assert_select cell_selector, text: Regexp.new("Test".to_s), count: 2
  end
end
