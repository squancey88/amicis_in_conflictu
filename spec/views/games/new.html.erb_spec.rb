require "rails_helper"

RSpec.describe "games/new", type: :view do
  let(:game) { create(:game) }

  before(:each) do
    assign(:game, game)
  end

  it "renders new game form" do
    render

    expect(rendered).to have_css("form[action='#{game_path(game)}']")
  end
end
