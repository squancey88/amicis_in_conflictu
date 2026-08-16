require "rails_helper"

RSpec.describe "armies/show", type: :view do
  let(:army) { create(:army, name: "Test Army") }
  before(:each) do
    assign(:army, army)
    assign(:presenter, ArmyPresenter.new(double, army))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Test Army/)
  end
end
