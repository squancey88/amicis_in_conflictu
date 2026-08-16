require "rails_helper"

RSpec.describe "gaming_groups/show", type: :view do
  let(:gaming_group) { create(:gaming_group, name: "Name") }

  before(:each) do
    assign(:gaming_group, gaming_group)
    assign(:presenter, GamingGroupPresenter.new(double, gaming_group))

    allow(view).to receive(:current_user) { create(:user) }
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
