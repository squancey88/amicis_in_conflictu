require "rails_helper"

RSpec.describe "articles/new", type: :view do
  let(:world) { create(:world) }
  before(:each) do
    assign(:article, Article.new(
      title: "MyString",
      world:
    ))
    assign(:world, world)
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", world_articles_path(world), "post" do
      assert_select "input[name=?]", "article[title]"
    end
  end
end
