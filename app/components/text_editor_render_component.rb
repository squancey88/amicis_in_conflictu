# frozen_string_literal: true

class TextEditorRenderComponent < ViewComponent::Base
  def initialize(model:, attribute:)
    json = model.send(attribute)
    @data = JSON.parse(json) if json
  end

  def render?
    @data
  end

  def blocks
    @data["blocks"]
  end
end
