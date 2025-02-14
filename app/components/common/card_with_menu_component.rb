# frozen_string_literal: true

class Common::CardWithMenuComponent < ViewComponent::Base
  renders_one :body
  renders_one :menu_section

  def initialize(title:, menu_options: nil, subtitle: nil)
    @title = title
    @menu_options = menu_options
    @subtitle = subtitle
  end
end
