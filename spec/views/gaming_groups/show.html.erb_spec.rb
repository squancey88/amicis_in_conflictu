require "rails_helper"

RSpec.describe "gaming_groups/show", type: :view do
  before(:each) do
    assign(:gaming_group, GamingGroup.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
