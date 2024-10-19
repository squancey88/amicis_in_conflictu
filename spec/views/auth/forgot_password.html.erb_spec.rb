require "rails_helper"

RSpec.describe "auth/forgot_password.html.erb", type: :view do
  it "renders the forgot password form" do
    render

    expect(rendered).to have_css("form[action='#{auth_reset_password_path}']")
  end
end
