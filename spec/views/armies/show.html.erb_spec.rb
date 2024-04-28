require "rails_helper"

RSpec.describe "armies/show", type: :view do
  before(:each) do
    assign(:army, create(:army, name: "Test Army"))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Test Army/)
  end
end
