# frozen_string_literal: true

class Common::PageHeaderComponent < ViewComponent::Base
  renders_one :control

  def initialize(presenter:)
    @presenter = presenter
  end
end
