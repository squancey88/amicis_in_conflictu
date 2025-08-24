require "rails_helper"

RSpec.describe "articles/index", type: :view do
  let(:world) { create(:world) }
  let!(:articles) { create_list(:article, 2, world:) }

  before(:each) do
    pagy, records = pagy(world.articles)
    assign(:world, world)
    assign(:pagy, pagy)
    assign(:articles, records)
  end

  it "renders a list of articles" do
    render
    expect(rendered).to have_css(".list-group-item", text: articles[0].title)
    expect(rendered).to have_css(".list-group-item", text: articles[1].title)
  end
end
