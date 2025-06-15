require "rails_helper"

RSpec.describe "quests/new", type: :view do
  before(:each) do
    assign(:quest, Quest.new(
      title: "MyString",
      blurb: "",
      world: nil
    ))
  end

  it "renders new quest form" do
    render

    assert_select "form[action=?][method=?]", quests_path, "post" do
      assert_select "input[name=?]", "quest[title]"
    end
  end
end
