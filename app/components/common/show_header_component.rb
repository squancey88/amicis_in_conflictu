# frozen_string_literal: true

class Common::ShowHeaderComponent < ViewComponent::Base
  def initialize(presenter:)
    @presenter = presenter
  end
end
