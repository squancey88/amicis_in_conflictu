require "rails_helper"

RSpec.describe "units/show", type: :view do
  let(:army_list) { create(:army_list) }
  before(:each) do
    assign(:army_list, army_list)
    assign(:unit, create(:unit, army_list:, cost: 2))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/2/)
  end
end
