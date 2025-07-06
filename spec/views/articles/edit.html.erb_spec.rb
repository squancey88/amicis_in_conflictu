require "rails_helper"

RSpec.describe "articles/edit", type: :view do
  let(:world) { create(:world) }
  let(:article) { create(:article, world:) }

  before(:each) do
    assign(:article, article)
    assign(:world, world)
  end

  it "renders the edit article form" do
    render

    assert_select "form[action=?][method=?]", world_article_path(world, article), "post" do
      assert_select "input[name=?]", "article[title]"
    end
  end
end
