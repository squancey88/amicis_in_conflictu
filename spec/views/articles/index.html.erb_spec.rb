require "rails_helper"

RSpec.describe "articles/index", type: :view do
  let(:world) { create(:world) }
  before(:each) do
    assign(:articles, create_list(:article, 2, title: "Title", world:))
    assign(:world, world)
  end

  it "renders a list of articles" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
  end
end
