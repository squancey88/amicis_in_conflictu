require "rails_helper"

RSpec.describe "army_lists/index", type: :view do
  before(:each) do
    assign(:army_lists, create_list(:army_list, 2, name: "Name"))
  end

  it "renders a list of army_lists" do
    render
    cell_selector = (Rails::VERSION::STRING >= "7") ? "div>p" : "tr>td"
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
  end
end
