require "rails_helper"

RSpec.describe "users/show.html.erb", type: :view do
  let(:user) { create(:user) }

  before do
    assign(:user, user)
    render
  end
  it "should render the form" do
    expect(rendered).to have_css("input[name='user[firstname]']")
  end
end
