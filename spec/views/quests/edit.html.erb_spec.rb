require "rails_helper"

RSpec.describe "quests/edit", type: :view do
  let(:world) { create(:world) }
  let(:quest) { create(:quest, world:) }

  before(:each) do
    assign(:quest, quest)
    assign(:world, world)
  end

  it "renders the edit quest form" do
    render

    assert_select "form[action=?][method=?]", world_quest_path(world, quest), "post" do
      assert_select "input[name=?]", "quest[title]"
    end
  end
end
