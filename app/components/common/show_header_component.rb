# frozen_string_literal: true

class Common::ShowHeaderComponent < ViewComponent::Base
  def initialize(show_presenter:)
    @show_presenter = show_presenter
  end
end
