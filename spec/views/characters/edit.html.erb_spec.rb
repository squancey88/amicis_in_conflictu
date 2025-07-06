require "rails_helper"

RSpec.describe "characters/edit", type: :view do
  let(:world) { create(:world) }
  let(:character) { create(:character, world:) }

  before(:each) do
    assign(:character, character)
    assign(:world, world)
  end

  it "renders the edit character form" do
    render

    assert_select "form[action=?][method=?]", world_character_path(world, character), "post" do
      assert_select "input[name=?]", "character[given_name]"
      assert_select "input[name=?]", "character[family_name]"
    end
  end
end
