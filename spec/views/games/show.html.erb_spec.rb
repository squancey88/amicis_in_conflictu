require "rails_helper"

RSpec.describe "games/show", type: :view do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }

  before(:each) do
    assign(:game, create(:game, user_list: [user1, user2]))
    allow(view).to receive(:current_user) { create(:user) }
    render
  end

  it "renders standard box" do
    expect(rendered).to have_css(".standard-box-content")
  end

  it "renders finish section" do
    expect(rendered).to have_css(".form-control__finish_section")
  end
end
