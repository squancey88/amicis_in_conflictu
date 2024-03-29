require "rails_helper"

RSpec.describe "games/index", type: :view do
  before(:each) do
    assign(:games, create_list(:game, 2))
  end

  it "renders a list of games" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
