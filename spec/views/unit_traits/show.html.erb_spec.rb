require "rails_helper"

RSpec.describe "unit_traits/show", type: :view do
  before(:each) do
    assign(:unit_trait, create(:unit_trait))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/false/)
  end
end
