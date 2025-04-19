require "rails_helper"

RSpec.describe "characters/new", type: :view do
  let(:world) { create(:world) }
  before(:each) do
    assign(:character, Character.new(world:))
    assign(:world, world)
  end

  it "renders new character form" do
    render

    assert_select "form[action=?][method=?]", characters_path, "post" do
      assert_select "input[name=?]", "character[given_name]"
      assert_select "input[name=?]", "character[family_name]"
    end
  end
end
