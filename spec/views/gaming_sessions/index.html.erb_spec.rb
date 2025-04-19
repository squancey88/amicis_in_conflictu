require "rails_helper"

RSpec.describe "gaming_sessions/index", type: :view do
  let(:gaming_group) { create(:gaming_group) }
  before(:each) do
    assign(:gaming_group, gaming_group)
    assign(:gaming_sessions, create_list(:gaming_session, 2, gaming_group:))
  end

  it "renders a list of gaming_sessions" do
    render
    expect(rendered).to have_css(".labelled-attribute", count: 2)
  end
end
