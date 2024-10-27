require "rails_helper"

RSpec.describe "gaming_sessions/new", type: :view do
  let(:gaming_group) { create(:gaming_group) }
  let(:user) { create(:user) }

  before(:each) do
    assign(:gaming_group, gaming_group)
    assign(:gaming_session, GamingSession.new)
    allow(view).to receive(:current_user) { user }
  end

  it "renders new gaming_session form" do
    render

    assert_select "form[action=?][method=?]", gaming_group_gaming_sessions_path(gaming_group), "post" do
      assert_select "select[name=?]", "gaming_session[gaming_group_id]"
    end
  end
end
