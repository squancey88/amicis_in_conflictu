require "rails_helper"

RSpec.describe "quests/show", type: :view do
  before(:each) do
    assign(:quest, create(:quest, title: "Title"))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end
end
