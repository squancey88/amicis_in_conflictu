require "rails_helper"

RSpec.describe "gaming_sessions/index", type: :view do
  before(:each) do
    assign(:gaming_sessions, create_list(:gaming_session, 2))
  end

  it "renders a list of gaming_sessions" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 4
  end
end
