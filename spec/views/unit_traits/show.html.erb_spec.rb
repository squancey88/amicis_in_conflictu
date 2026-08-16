require "rails_helper"

RSpec.describe "unit_traits/show", type: :view do
  let(:unit_trait) { create(:unit_trait) }
  before(:each) do
    assign(:unit_trait, unit_trait)
    assign(:presenter, UnitTraitPresenter.new(double, unit_trait))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/false/)
  end
end
