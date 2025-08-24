require "rails_helper"

RSpec.describe "organisations/edit", type: :view do
  let(:world) { create(:world) }
  let(:organisation) { create(:organisation, world:) }

  before(:each) do
    assign(:world, world)
    assign(:organisation, organisation)
  end

  it "renders the edit organisation form" do
    render

    assert_select "form[action=?][method=?]", world_organisation_path(world, organisation), "post" do
      assert_select "input[name=?]", "organisation[name]"
      assert_select "select[name=?]", "organisation[organisation_type_id]"
    end
  end
end
