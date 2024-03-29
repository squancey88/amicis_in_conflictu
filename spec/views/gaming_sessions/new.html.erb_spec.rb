require "rails_helper"

RSpec.describe "gaming_sessions/new", type: :view do
  let(:user) { create(:user) }

  before(:each) do
    assign(:gaming_session, GamingSession.new(
      gaming_group: nil
    ))
    allow(controller).to receive(:current_user) { user }
  end

  it "renders new gaming_session form" do
    render

    assert_select "form[action=?][method=?]", gaming_sessions_path, "post" do
      assert_select "select[name=?]", "gaming_session[gaming_group_id]"
    end
  end
end
