require "rails_helper"

RSpec.describe "unit_templates/show", type: :view do
  let(:unit_template) { create(:unit_template, name: "Name", cost: 2) }
  before(:each) do
    assign(:unit_template, unit_template)
    assign(:presenter, UnitTemplatePresenter.new(double, unit_template))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
