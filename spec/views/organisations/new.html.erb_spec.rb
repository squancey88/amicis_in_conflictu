require "rails_helper"

RSpec.describe "organisations/new", type: :view do
  let(:world) { create(:world) }
  before(:each) do
    assign(:world, world)
    assign(:organisation, Organisation.new(
      name: "MyString",
      world: world,
      organisation_type: nil
    ))
  end

  it "renders new organisation form" do
    render

    assert_select "form[action=?][method=?]", world_organisations_path(world), "post" do
      assert_select "input[name=?]", "organisation[name]"
      assert_select "select[name=?]", "organisation[organisation_type_id]"
    end
  end
end
