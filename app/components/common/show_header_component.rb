# frozen_string_literal: true

class Common::ShowHeaderComponent < ViewComponent::Base
  renders_one :control

  def initialize(presenter:)
    @presenter = presenter
  end
end
