# frozen_string_literal: true

class RecordShowWrapperComponent < ViewComponent::Base
  renders_one :body

  def initialize(record:, title:, menu_options: [])
    @record = record
    @menu_options = menu_options
    @title = title
  end
end
