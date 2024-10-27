require "rails_helper"

RSpec.describe "gaming_sessions/edit", type: :view do
  let(:gaming_group) { create(:gaming_group) }
  let(:gaming_session) { create(:gaming_session, gaming_group:) }
  let(:user) { create(:user) }

  before(:each) do
    assign(:gaming_session, gaming_session)
    assign(:gaming_group, gaming_group)
    allow(view).to receive(:current_user) { user }
  end

  it "renders the edit gaming_session form" do
    render

    assert_select "form[action=?][method=?]", gaming_group_gaming_session_path(gaming_group, gaming_session), "post" do
      assert_select "select[name=?]", "gaming_session[gaming_group_id]"
    end
  end
end
