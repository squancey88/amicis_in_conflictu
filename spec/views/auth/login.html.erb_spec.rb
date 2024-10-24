require "rails_helper"

RSpec.describe "auth/login.html.erb", type: :view do
  it "renders the login form" do
    render

    expect(rendered).to have_css("form[action='#{auth_authenticate_path}']")
  end
end
