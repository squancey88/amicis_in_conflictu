require "rails_helper"

RSpec.describe "teams/show", type: :view do
  let(:gaming_group) { create(:gaming_group) }
  before(:each) do
    assign(:gaming_group, gaming_group)
    assign(:team, create(:team, gaming_group:))
  end

  it "renders attributes in <p>" do
    render
  end
end
