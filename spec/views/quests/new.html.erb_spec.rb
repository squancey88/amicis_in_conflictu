require "rails_helper"

RSpec.describe "quests/new", type: :view do
  let(:world) { create(:world) }
  before(:each) do
    assign(:quest, Quest.new(
      title: "MyString",
      blurb: "",
      world:
    ))
    assign(:world, world)
  end

  it "renders new quest form" do
    render

    assert_select "form[action=?][method=?]", world_quests_path(world), "post" do
      assert_select "input[name=?]", "quest[title]"
    end
  end
end
