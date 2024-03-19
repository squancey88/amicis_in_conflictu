# frozen_string_literal: true

class ErrorPanelComponent < ViewComponent::Base
  def initialize(model_name:, errors:)
    @model_name = model_name
    @errors = errors
  end

  def render?
    @errors&.any?
  end
end
