require "rails_helper"

RSpec.describe "worlds/new", type: :view do
  before(:each) do
    assign(:world, World.new)
  end

  it "renders new world form" do
    render

    assert_select "form[action=?][method=?]", worlds_path, "post" do
      assert_select "input[name=?]", "world[name]"
    end
  end
end
