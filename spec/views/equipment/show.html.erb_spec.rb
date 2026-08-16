require "rails_helper"

RSpec.describe "equipment/show", type: :view do
  let(:equipment) { create(:equipment) }
  before(:each) do
    assign(:equipment, equipment)
    assign(:presenter, EquipmentPresenter.new(double, equipment))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
