# frozen_string_literal: true

class TextEditorRenderComponent < ViewComponent::Base
  def initialize(model:, attribute:)
    @data = JSON.parse(model.send(attribute))
  end

  def blocks
    @data["blocks"]
  end
end
