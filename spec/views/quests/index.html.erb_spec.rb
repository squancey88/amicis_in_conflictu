require "rails_helper"

RSpec.describe "quests/index", type: :view do
  before(:each) do
    assign(:quests, create_list(:quest, 2, title: "Title"))
  end

  it "renders a list of quests" do
    render
    expect(rendered).to have_text("Title", count: 2)
  end
end
