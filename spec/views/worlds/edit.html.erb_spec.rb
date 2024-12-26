require "rails_helper"

RSpec.describe "worlds/edit", type: :view do
  let(:world) { create(:world) }

  before(:each) do
    assign(:world, world)
  end

  it "renders the edit world form" do
    render

    assert_select "form[action=?][method=?]", world_path(world), "post" do
      assert_select "input[name=?]", "world[name]"
    end
  end
end
