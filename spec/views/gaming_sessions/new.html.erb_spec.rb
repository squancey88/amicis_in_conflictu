require "rails_helper"

RSpec.describe "gaming_sessions/new", type: :view do
  before(:each) do
    assign(:gaming_session, GamingSession.new(
      gaming_group: nil
    ))
  end

  it "renders new gaming_session form" do
    render

    assert_select "form[action=?][method=?]", gaming_sessions_path, "post" do
      assert_select "input[name=?]", "gaming_session[gaming_group_id]"
    end
  end
end
