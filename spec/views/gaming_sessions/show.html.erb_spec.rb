require "rails_helper"

RSpec.describe "gaming_sessions/show", type: :view do
  let(:gaming_group) { create(:gaming_group) }
  before(:each) do
    assign(:gaming_group, gaming_group)
    assign(:gaming_session, create(:gaming_session, gaming_group:))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
