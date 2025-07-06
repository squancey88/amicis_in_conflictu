require "rails_helper"

RSpec.describe "quests/show", type: :view do
  let(:world) { create(:world) }
  before(:each) do
    assign(:quest, create(:quest, title: "Title", world:))
    assign(:world, world)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end
end
