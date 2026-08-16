require "rails_helper"

RSpec.describe "quests/show", type: :view do
  let(:world) { create(:world) }
  let(:quest) { create(:quest, title: "Title", world:) }
  before(:each) do
    assign(:world, world)
    assign(:quest, quest)
    assign(:presenter, QuestPresenter.new(double, quest))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end
end
