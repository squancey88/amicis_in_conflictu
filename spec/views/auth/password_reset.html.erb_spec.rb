require "rails_helper"

RSpec.describe "auth/password_reset.html.erb", type: :view do
  it "renders the forgot password form" do
    render

    expect(rendered).to have_css("form[action='#{auth_complete_password_reset_path}']")
  end
end
