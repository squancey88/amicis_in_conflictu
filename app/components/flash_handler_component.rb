# frozen_string_literal: true

class FlashHandlerComponent < ViewComponent::Base
  delegate :flash, to: :helpers

  def key_to_class key
    case key.to_sym
    when :notice
      "alert-primary"
    when :alert
      "alert-danger"
    end
  end

  def render?
    flash.any?
  end
end
