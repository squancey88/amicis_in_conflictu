require "rails_helper"

RSpec.describe "games/index", type: :view do
  before(:each) do
    assign(:games, create_list(:game, 2))
  end

  it "renders a list of games" do
    render
    expect(rendered).to have_css("div>p", count: 2)
  end
end
