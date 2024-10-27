require "rails_helper"

RSpec.describe "gaming_sessions/index", type: :view do
  let(:gaming_group) { create(:gaming_group) }
  before(:each) do
    assign(:gaming_group, gaming_group)
    assign(:gaming_sessions, create_list(:gaming_session, 2, gaming_group:))
  end

  it "renders a list of gaming_sessions" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 4
  end
end
