require "rails_helper"

RSpec.describe "gaming_groups/index", type: :view do
  before(:each) do
    assign(:gaming_groups, [
      GamingGroup.create!(
        name: "Name"
      ),
      GamingGroup.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of gaming_groups" do
    render
    cell_selector = (Rails::VERSION::STRING >= "7") ? "div>p" : "tr>td"
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
  end
end
