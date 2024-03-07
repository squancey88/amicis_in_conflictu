require "rails_helper"

RSpec.describe "gaming_sessions/show", type: :view do
  before(:each) do
    assign(:gaming_session, create(:gaming_session))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
