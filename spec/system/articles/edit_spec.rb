require "rails_helper"

RSpec.describe("Edit Article", type: :system) do
  let(:user) { create(:user) }
  let(:world) { create(:world, owner: user) }
  let(:article) { create(:article, world:, text_section_count: 0) }

  before do
    allow_any_instance_of(AuthHelper).to receive(:current_user).and_return(user)
    visit edit_world_article_path(world, article)
  end

  it "should render title containing article title" do
    expect(page).to have_css(".card-title", text: article.title)
  end

  it "should not render input for section" do
    expect(page).not_to have_css("input[name*='article[sections_attributes]']")
  end

  it "should add new section" do
    click_on "Add New Section"
    expect(page).to have_css("input[name*='article[sections_attributes]']")
  end
end
