require "rails_helper"

RSpec.describe "army_lists/show", type: :view do
  before(:each) do
    assign(:army_list, create(:army_list, name: "Name"))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
