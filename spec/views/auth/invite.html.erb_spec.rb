require "rails_helper"

RSpec.describe "auth/invite.html.erb", type: :view do
  it "renders the invite form" do
    render

    expect(rendered).to have_css("form[action='#{auth_complete_invite_path}']")
  end
end
