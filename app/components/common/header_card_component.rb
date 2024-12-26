# frozen_string_literal: true

class Common::HeaderCardComponent < ViewComponent::Base
  renders_one :menu_items
  renders_one :buttons

  def initialize(title:, subtitle: nil)
    @title = title
    @subtitle = subtitle
  end
end
