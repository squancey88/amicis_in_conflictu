require "rails_helper"

RSpec.describe "games/edit", type: :view do
  let(:game) { create(:game) }

  before(:each) do
    assign(:game, game)
  end

  it "renders the edit game form" do
    render

    expect(rendered).to have_css("form[action='#{game_path(game)}']")
  end
end
