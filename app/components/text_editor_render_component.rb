# frozen_string_literal: true

class TextEditorRenderComponent < ViewComponent::Base
  def initialize(model:, attribute:)
    json = model.send(attribute)
    @data = JSON.parse(json) if json.present?
  end

  def render?
    @data&.has_key?("blocks")
  end

  def blocks
    @data["blocks"]
  end
end
