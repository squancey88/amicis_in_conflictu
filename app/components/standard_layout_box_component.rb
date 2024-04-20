# frozen_string_literal: true

class StandardLayoutBoxComponent < ViewComponent::Base
  renders_one :body
  renders_one :menu

  def initialize(title:)
    @title = title
  end
end
