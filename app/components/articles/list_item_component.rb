# frozen_string_literal: true

class Articles::ListItemComponent < Common::ListItemComponent
  def initialize(article:)
    super(record: article)
    @article = article
  end

  def display_name
    article.title
  end

  def link
    [article.world, article]
  end

  private

  attr_reader :article
end
