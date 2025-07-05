require 'rails_helper'

RSpec.describe "location_types/index", type: :view do
  before(:each) do
    assign(:location_types, [
      LocationType.create!(
        name: "Name",
        world: nil
      ),
      LocationType.create!(
        name: "Name",
        world: nil
      )
    ])
  end

  it "renders a list of location_types" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
