require "rails_helper"

RSpec.describe "games/show", type: :view do
  before(:each) do
    assign(:game, create(:game))
  end

  it "renders attributes in <p>" do
    render
  end
end
