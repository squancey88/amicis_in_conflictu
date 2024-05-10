require "rails_helper"

RSpec.describe "army_lists/show", type: :view do
  let(:army) { create(:army) }

  before(:each) do
    assign(:army, army)
    assign(:army_list, create(:army_list, name: "Name", army:))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
