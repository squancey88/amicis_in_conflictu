require "rails_helper"

RSpec.describe "unit_templates/edit", type: :view do
  let(:unit_template) { create(:unit_template) }

  before(:each) do
    assign(:unit_template, unit_template)
  end

  it "renders the edit unit_template form" do
    render

    assert_select "form[action=?][method=?]", unit_template_path(unit_template), "post" do
      assert_select "input[name=?]", "unit_template[name]"

      assert_select "input[name=?]", "unit_template[cost]"
    end
  end
end
