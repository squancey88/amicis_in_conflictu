require "rails_helper"

RSpec.describe "articles/show", type: :view do
  let(:world) { create(:world) }
  before(:each) do
    assign(:article, create(:article, title: "Title", world:))
    assign(:world, world)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end
end
