require "rails_helper"

RSpec.describe "equipment/show", type: :view do
  before(:each) do
    assign(:equipment, create(:equipment))
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
