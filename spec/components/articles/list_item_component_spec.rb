# frozen_string_literal: true

require "rails_helper"

RSpec.describe Articles::ListItemComponent, type: :component do
  let(:world) { create(:world) }
  let(:article) { create(:article, world:) }

  before do
    render_inline(described_class.new(article:))
  end

  it "should render li" do
    expect(page).to have_css(".list-group-item", text: article.title)
  end

  it "should link to article" do
    expect(page).to have_link(article.title, href: "/worlds/#{world.id}/articles/#{article.id}", target: "_top")
  end
end
