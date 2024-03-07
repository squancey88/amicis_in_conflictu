require "rails_helper"

RSpec.describe "gaming_sessions/edit", type: :view do
  let(:gaming_session) { create(:gaming_session) }

  before(:each) do
    assign(:gaming_session, gaming_session)
  end

  it "renders the edit gaming_session form" do
    render

    assert_select "form[action=?][method=?]", gaming_session_path(gaming_session), "post" do
      assert_select "input[name=?]", "gaming_session[gaming_group_id]"
    end
  end
end
