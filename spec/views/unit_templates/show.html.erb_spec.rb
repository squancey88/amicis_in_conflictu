require "rails_helper"

RSpec.describe "unit_templates/show", type: :view do
  before(:each) do
    assign(:unit_template, create(:unit_template, name: "Name", cost: 2))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
